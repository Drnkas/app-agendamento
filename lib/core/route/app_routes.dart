import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/intro/pages/splash/splash_page.dart';


final router = GoRouter(
  initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path:  AppRoutes.splash,
          builder: (context, state) => const SplashPage()
      ),
      GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => const OnboardingPage()
      )
    ]
);


class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static String productDetails(String id) => '/products/$id';
}