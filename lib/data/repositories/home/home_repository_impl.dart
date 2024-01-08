import 'package:gelivery_myanmar_code_test/data/datasources/network/dio_helper.dart';
import 'package:gelivery_myanmar_code_test/domain/repositories/home/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  fetchPickUpList() {
    return DioHelper.instance.fetchPickUpList();
  }
}
