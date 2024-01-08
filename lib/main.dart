import 'package:flutter/material.dart';
import 'package:gelivery_myanmar_code_test/data/datasources/network/dio_helper.dart';
import 'package:gelivery_myanmar_code_test/presentation/pages/auth/login_page.dart';
import 'package:get/get.dart';
import 'core/core_init/core_init.dart';

void main() async {
  await initServices();
  runApp(const GetMaterialApp(home: LoginPage()));
}

initServices() async {
  debugPrint('Starting Services .....');
  await Get.putAsync(() => CoreInit().init());
  await DioHelper.instance.init();
  debugPrint('Success starting for all services .....');
}
