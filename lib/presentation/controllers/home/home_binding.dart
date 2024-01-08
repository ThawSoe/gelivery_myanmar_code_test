import 'package:gelivery_myanmar_code_test/domain/usecases/home/home_usecase_impl.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find<HomeUseCaseImpl>()));
    Get.lazyPut(() => HomeUseCaseImpl());
  }
}
