import 'package:get/get.dart';
import '../../../domain/usecases/auth/auth_usecase_impl.dart';
import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(Get.find<AuthUseCaseImpl>()));
    Get.lazyPut(() => AuthUseCaseImpl());
  }
}
