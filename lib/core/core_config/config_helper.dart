// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:gelivery_myanmar_code_test/core/core_config/config_constant.dart';
import 'package:gelivery_myanmar_code_test/data/datasources/network/dio_helper.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/auth/auth_controller.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class ConfigHelper {
  //URL
  static const BASE_URL = "https://dev.gigagates.com/qq-delivery-backend";

  static const login = "$BASE_URL/v3/user/";

  static const revokeToken =
      "$BASE_URL/v3/user/revoke_access_token_by_username";

  static const pickUp = "$BASE_URL/v4/pickup/list";

  //Body
  static Map<String, dynamic> get b_login => {
        "username": Get.find<AuthController>().userNameCtrl.text,
        "password": Get.find<AuthController>().pswCtrl.text
      };

  static Map<String, dynamic> get b_pickUp => {
        "first": Get.find<HomeController>().currentPage,
        "max": ConfigConstant.paginationCount
      };

  static Map<String, dynamic> get b_noData => {};

  static Map<String, dynamic> get h_token => {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${DioHelper.instance.getData(key: ConfigConstant.s_access_token)}",
      };
}
