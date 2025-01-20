import 'package:app_agendamento/core/flavor/flavor.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/di/di.dart';
import 'package:device_preview/device_preview.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/widgets/alert/alert_area.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';


void bootstrap(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  await configureDependencies(config);

  runApp(DevicePreview(
    builder: (_) => const App(),
    enabled: true //config.flavor == AppFlavor.dev,
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppTheme(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        builder: (context, widget) {
          final newChild = Stack(
            children: [
              if (widget != null) widget,
              const AlertArea(),
            ],
          );

          return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, newChild),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          );
        },
        locale: DevicePreview.locale(context),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
