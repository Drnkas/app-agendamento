import 'package:app_agendamento/core/helpers/token_interceptor.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed.dart';
import 'package:app_agendamento/features/auth/data/results/validate_token_failed.dart';
import 'package:app_agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/result.dart';

abstract class AuthDatasource {
  Future<Result<LoginFailed, User>> login({required String email, required String password});
  Future<Result<ValidateTokenFailed, User>> validateToken(String token);
}
class RemoteAuthDatasource implements AuthDatasource {

  RemoteAuthDatasource(this._dio);

  final Dio _dio;

  Future<Result<LoginFailed, User>> login({required String email, required String password}) async {
    try{
      final response = await _dio.post('v1-sign-in', data: {
        'email': email,
        'password': password
      });

      return Success(User.fromMap(response.data['result']));

    } on DioException catch (e) {
      if(e.type == DioExceptionType.unknown){
        return const Failure(LoginFailed.offline);
      }else if(e.response?.statusCode == 404){
        return const Failure(LoginFailed.invalidCredentials);
      }
      return const Failure(LoginFailed.unknownError);
    } catch (_) {
      return const Failure(LoginFailed.unknownError);
    }
  }

  @override
  Future<Result<ValidateTokenFailed, User>> validateToken(String token) async {
    try{
      final response = await _dio.post(
        '/v1-get-user',
        options: Options(
          headers: {
            'x-parse-session-token': token,
          },
        ),
      );

      return Success(User.fromMap(response.data['result']));
    } on DioException {
      return const Failure(ValidateTokenFailed.invalidToken);
    } catch (_) {
      return const Failure(ValidateTokenFailed.unknownError);
    }
  }
}



