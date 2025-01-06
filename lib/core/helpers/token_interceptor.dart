import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor{

  //final AuthRepository authRepository;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
   // options.headers['X-Parse-Session-Token'] = 'token';
    handler.next(options);
  }
}