import 'package:gelivery_myanmar_code_test/presentation/controllers/home/home_binding.dart';
import 'package:get/get.dart';
import '../../presentation/controllers/auth/auth_binding.dart';

class CoreInit extends GetxService {
  init() async {
    AuthBinding().dependencies();
    HomeBinding().dependencies();
    return this;
  }
}
