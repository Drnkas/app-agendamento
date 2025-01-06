import 'package:app_agendamento/core/device/app_secure_storage.dart';
import 'package:app_agendamento/features/auth/data/auth_datasource.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed.dart';
import 'package:app_agendamento/features/auth/data/results/validate_token_failed.dart';
import 'package:app_agendamento/features/auth/models/user.dart';

import '../../../core/helpers/result.dart';

class AuthRepository {

  AuthRepository(this._datasource, this._appSecureStorage);

  final AuthDatasource _datasource;
  final AppSecureStorage _appSecureStorage;

  User? user;

  Future<Result<LoginFailed, User>> login({required String email, required String password}) async {
    final result = await _datasource.login(email: email, password: password);

    if(result case Success(object: final user)){
      this.user = user;
    }

    return result;
  }

  Future<Result<ValidateTokenFailed, User>> validateToken() async {
    final token = await _appSecureStorage.getSessionToken();
    if(token == null) {
      return const Failure(ValidateTokenFailed.invalidToken);
    }
    final result = await _datasource.validateToken(token);

    if (result case Success(object: final user)){
      this.user = user;
    }

    return result;
  }

}