import 'package:app_agendamento/features/auth/data/auth_datasource.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_results.dart';
import 'package:app_agendamento/features/auth/models/user.dart';

import '../../../core/helpers/result.dart';

class AuthRepository {

  AuthRepository(this._datasource);

  final AuthDatasource _datasource;

  User? user;

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    final result = await _datasource.login(email: email, password: password);

    if(result case Success(object: final user)){
      this.user = user;
    }

    return result;
  }

}