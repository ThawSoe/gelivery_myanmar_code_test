import 'package:gelivery_myanmar_code_test/core/core_config/config_result.dart';
import 'package:gelivery_myanmar_code_test/data/models/access_token_DTO.dart';
import 'package:gelivery_myanmar_code_test/domain/usecases/auth/auth_usecase.dart';
import 'package:get/get.dart';
import '../../../data/repositories/auth/auth_repository_impl.dart';
import '../../repositories/auth/auth_repository.dart';

class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository _authRepository = AuthRepositoryImpl();

  @override
  Future<AccessTokenDTO> login() async {
    Result result = await _authRepository.login();
    if (result.success) {
      return AccessTokenDTO.fromJson(result.data);
    }
    Get.snackbar(result.errorCode.toString(), result.errorMessage.toString());
    return AccessTokenDTO(success: false);
  }

  @override
  fetchRefreshAccessToken() {
    throw UnimplementedError();
  }

  @override
  fetchRevokeAccessToken() async {
    Result result = await _authRepository.fetchRevokeAccessToken();
    if (result.success) {
      return true;
    }
    return false;
  }
}
