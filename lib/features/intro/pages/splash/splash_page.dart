import 'package:app_agendamento/features/intro/pages/splash/splash_page_actions.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> implements SplashPageActions {

  late final SplashPageCubit cubit = SplashPageCubit(this);

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 150),
      ),
    );
  }

  @override
  void navToOnboarding() {
    context.go(AppRoutes.onboarding);
  }

  @override
  void navToMaintenance() {
    context.go('/maintenance');
  }

  @override
  void navToAuth() {
    context.go('/auth');
  }

  @override
  void navToHome() {
    context.go('/home');
  }

  @override
  void navToForceUpdate() {
    context.go('/forceUpdate');
  }

  @override
  void dispose() {
    super.dispose();
    cubit.dispose();
  }

}
