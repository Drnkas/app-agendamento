import 'package:app_agendamento/core/flavor/flavor.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/helpers/token_interceptor.dart';
import '../features/auth/data/auth_datasource.dart';

final getIt = GetIt.I;

Future<void> configDependecies(FlavorConfig config) async {
  getIt.registerSingleton(config);

  getIt.registerSingleton(() => Dio(
      BaseOptions(
          baseUrl: config.baseUrl,
          headers: {
            'X-Parse-Application-Id': config.appId,
            'X-Parse-REST-Api-Key': config.restKey
          }))..interceptors.addAll([
    TokenInterceptor(),

    if(config.flavor == AppFlavor.dev)
    PrettyDioLogger(requestHeader: true, requestBody: true),
  ]));

  getIt.registerSingleton(() => RemoteAuthDatasource(getIt()));
  getIt.registerSingleton(() => AuthRepository(getIt()));
}