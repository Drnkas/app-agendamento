import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/device/app_external_launcher.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../di/di.dart';

class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: IntroBasePage(
              imagePath: 'assets/intro/force-update.svg',
              title: 'Nova atualização',
              body:
              'Atualize o app para receber todas as novidades!',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
              child: AppButton(
                label: 'Atualizar',
                onPressed: getIt<AppExternalLauncher>().launchStore,
              ),
            ),
          )
        ],
      ),
    );
  }
}
