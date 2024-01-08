import 'package:gelivery_myanmar_code_test/core/core_config/config_result.dart';
import 'package:gelivery_myanmar_code_test/data/models/pick_up_DTO.dart';
import 'package:gelivery_myanmar_code_test/data/repositories/home/home_repository_impl.dart';
import 'package:gelivery_myanmar_code_test/domain/repositories/home/home_repository.dart';
import 'package:gelivery_myanmar_code_test/domain/usecases/home/home_usecase.dart';

class HomeUseCaseImpl implements HomeUseCase {
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  @override
  fetchPickUpList() async {
    Result result = await _homeRepository.fetchPickUpList();
    if (result.success) {
      return PickUpListDTO.fromJson(result.data);
    }
    return PickUpListDTO(success: false);
  }
}
