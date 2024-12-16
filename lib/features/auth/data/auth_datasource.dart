import 'package:app_agendamento/core/helpers/token_interceptor.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_results.dart';
import 'package:app_agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/result.dart';

class AuthDatasource {

  final Dio _dio = Dio(
      BaseOptions(
          baseUrl: 'https://parseapi.back4app.com/functions',
          headers: {
            'X-Parse-Application-Id':'jAy4H6m42cTR9NsizOFvny60mBM9MAKTjsMVB6kT',
            'X-Parse-REST-Api-Key':'pMllsmZ1qgGlpPx9yUU5Aaas5HLugAvl65B7XJRb'
          }))..interceptors.addAll([
            TokenInterceptor(),
            PrettyDioLogger(requestHeader: true, requestBody: true),
  ]);

  Future<Result<LoginFailedResult, User>> login({required String email, required String password}) async {
    try{
      final response = await _dio.post('v1-sign-in', data: {
        'email': email,
        'password': password
      });

      return Success(User.fromMap(response.data['result']));

    } on DioException catch (e) {

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



