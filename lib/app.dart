import 'package:app_agendamento/core/flavor/flavor.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/di/di.dart';

import 'package:flutter/material.dart';


void bootstrap(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configDependecies(config);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
