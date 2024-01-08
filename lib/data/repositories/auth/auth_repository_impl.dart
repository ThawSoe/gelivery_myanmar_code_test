import 'package:gelivery_myanmar_code_test/data/datasources/network/dio_helper.dart';
import 'package:gelivery_myanmar_code_test/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  login() {
    return DioHelper.instance.login();
  }

  @override
  fetchRevokeAccessToken() {
    return DioHelper.instance.fetchRevokeAccessToken();
  }
}
