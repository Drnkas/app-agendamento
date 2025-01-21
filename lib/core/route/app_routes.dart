import 'package:app_agendamento/features/auth/pages/auth/auth_page.dart';
import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/pages/sign_up/signup_page.dart';
import '../../features/intro/pages/force_update/force_update_page.dart';
import '../../features/intro/pages/maintenance/maintenance_page.dart';
import '../../features/intro/pages/not_found_page/not_found_page.dart';
import '../../features/intro/pages/splash/splash_page.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    return null;
  },
  errorBuilder: (context, state) => NotFoundPage(),
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthPage(),
      routes: [
        GoRoute(
          path: AppRoutes.signUp.path,
          builder: (context, state) => const SignUpPage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.maintenance,
      builder: (context, state) => const MaintenancePage(),
    ),
    GoRoute(
      path: AppRoutes.forceUpdate,
      builder: (context, state) => const ForceUpdatePage(),
    ),

  ],
);

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String maintenance = '/maintenance';
  static const String forceUpdate = '/force-update';
  static const String home = '/home';

  static const AppRoute signUp = AppRoute(
    fullPath: '/auth/signup',
    path: 'signup',
  );
}

class AppRoute {
  const AppRoute({required this.fullPath, required this.path});

  final String fullPath;
  final String path;
}