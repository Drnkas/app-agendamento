import 'package:app_agendamento/features/intro/pages/splash/splash_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final SplashPageCubit cubit = SplashPageCubit();

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        body: Center(
          child: FlutterLogo(size: 150),
        ),
      )
    );
  }
}
