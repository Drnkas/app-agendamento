import 'package:app_agendamento/core/helpers/token_interceptor.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_results.dart';
import 'package:app_agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/result.dart';

abstract class AuthDatasource {
  Future<Result<LoginFailedResult, User>> login({required String email, required String password});
}
class RemoteAuthDatasource implements AuthDatasource {

  RemoteAuthDatasource(this._dio);

  final Dio _dio;

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    try{
      final response = await _dio.post('v1-sign-in', data: {
        'email': email,
        'password': password
      });

      return Success(User.fromMap(response.data['result']));

    } on DioException catch (e) {
;
      if(e.type == DioExceptionType.unknown){
        return const Failure(LoginFailedResult.offline);
      }else if(e.response?.statusCode == 404){
        return const Failure(LoginFailedResult.invalidCredentials);
      }
      return const Failure(LoginFailedResult.unknownError);
    } catch (_) {
      return const Failure(LoginFailedResult.unknownError);
    }
  }
}



