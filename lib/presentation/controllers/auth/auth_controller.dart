import 'package:flutter/material.dart';
import 'package:gelivery_myanmar_code_test/core/core_config/config_constant.dart';
import 'package:gelivery_myanmar_code_test/data/datasources/network/dio_helper.dart';
import 'package:gelivery_myanmar_code_test/data/models/access_token_DTO.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/home/home_controller.dart';
import 'package:gelivery_myanmar_code_test/presentation/pages/auth/login_page.dart';
import 'package:gelivery_myanmar_code_test/presentation/pages/home/home_page.dart';
import 'package:get/get.dart';
import '../../../domain/usecases/auth/auth_usecase.dart';

class AuthController extends GetxController {
  AuthController(this._authUseCase);
  final AuthUseCase? _authUseCase;

  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController pswCtrl = TextEditingController();

  HomeController homeController = Get.find<HomeController>();

  login() async {
    AccessTokenDTO data = await _authUseCase?.login();
    if (data.success ?? false) {
      await saveLocalStorage(data);
      homeController.fetchPickUpList();
      clear();
      Get.offAll(() => HomePage());
    } else {
      debugPrint("You are something wrong");
    }
  }

  revokeAccessToken() async {
    bool result = await _authUseCase?.fetchRevokeAccessToken();
    if (result) {
      homeController.currentPage = 1;
      Get.offAll(() => const LoginPage());
    }
  }

  saveLocalStorage(AccessTokenDTO data) async {
    DioHelper.instance.saveData(
        key: ConfigConstant.s_access_token,
        value: data.data?.accessToken.toString() ?? ConfigConstant.no_data);
    DioHelper.instance.saveData(
        key: ConfigConstant.s_refresh_token,
        value: data.data?.refreshToken.toString() ?? ConfigConstant.no_data);
    DioHelper.instance.saveData(
        key: ConfigConstant.s_expire_in,
        value: data.data?.expiresIn.toString() ?? ConfigConstant.no_data);
  }

  clear() {
    userNameCtrl.clear();
    pswCtrl.clear();
  }
}
