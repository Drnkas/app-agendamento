import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_base_page.dart';
import 'package:app_agendamento/core/widgets/app_icon_button.dart';
import 'package:app_agendamento/core/widgets/app_text_field.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return AppBasePage(
      title: 'Criar conta',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: AppLogo(),
          ),
          const SizedBox(height: 10),
          Text(
            'Cadastre-se',
            textAlign: TextAlign.center,
            style: t.heading36Bold,
          ),
          const SizedBox(height: 32),
          AppTextField(
            title: 'Nome Completo',
            hint: 'Informe seu Nome Comple',
            textInputType: TextInputType.name,
            onChanged: (t) {},
          ),
          const SizedBox(height: 24),
          AppTextField(
            title: 'CPF',
            hint: 'Informe seu CPF',
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            onChanged: (t) {},
          ),
          const SizedBox(height: 24),
          AppTextField(
            title: 'Celular',
            hint: 'Informe seu número de celular',
            textInputType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
            onChanged: (t) {},
          ),
          const SizedBox(height: 24),
          AppTextField(
            title: 'E-mail',
            hint: 'Informe seu e-mail',
            textInputType: TextInputType.emailAddress,
            onChanged: (t) {},
          ),
          const SizedBox(height: 24),
          AppTextField(
            title: 'Senha',
            hint: 'Informe uma senha forte',
            obscure: true,
            onChanged: (t) {},
          ),
          const SizedBox(height: 24),
          AppButton(
            label: 'Cadastrar',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
