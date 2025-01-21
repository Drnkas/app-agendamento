
import 'package:app_agendamento/app.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/core/widgets/app_button.dart';
import 'package:app_agendamento/core/widgets/app_outlined_button.dart';
import 'package:app_agendamento/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/brand/logo_nome_mini.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 32),
                Text(
                    'Olá! Como deseja entrar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: t.black
                  ),
                ),
                const SizedBox(height: 32),
                AppButton(label: 'Entrar', onPressed: () {},),
                const SizedBox(height: 32),
                AppOutlinedButton(
                    label: 'Cadastre-se',
                    onPressed: () => context.push(AppRoutes.signUp.fullPath)
                ),
                const SizedBox(height: 32),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Expanded(child: Center(child: Text('Ou' ))),
                    Expanded(child: Divider()),
                  ],
                ),

                AppTextButton(
                  label: 'Entrar como visitante',
                  color: t.primary,
                ),

                const SizedBox(height: 32),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
