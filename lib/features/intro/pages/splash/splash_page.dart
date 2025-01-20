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
        child: BouncingLogo()
      )
    );
  }

  @override
  void navToOnboarding() {
    context.go(AppRoutes.onboarding);
  }

  @override
  void navToMaintenance() {
    context.go(AppRoutes.maintenance);
  }

  @override
  void navToAuth() {
    context.go('/AppRoutes.auth');
  }

  @override
  void navToHome() {
    context.go(AppRoutes.home);
  }

  @override
  void navToForceUpdate() {
    context.go(AppRoutes.forceUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

}

class BouncingLogo extends StatefulWidget {
  const BouncingLogo({super.key});

  @override
  _BouncingLogoState createState() => _BouncingLogoState();
}

class _BouncingLogoState extends State<BouncingLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/brand/logo_nome.png',
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}