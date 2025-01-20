import 'package:app_agendamento/core/widgets/app_text_button.dart';
import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/alert/alert_area_cubit.dart';
import '../../../../di/di.dart';

class NotFoundPage extends StatelessWidget {
  NotFoundPage({Key? key}) : super(key: key);

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: IntroBasePage(
              imagePath: 'assets/intro/not-found.svg',
              title: 'Página não\n encontrada :(',
              body: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90, left: 24, right: 24),
            child: Align(
              alignment: Alignment.center,
              child: AppTextButton(
                label: 'Voltar',
                onPressed: () {
                  getIt<AlertAreaCubit>().showAlert(
                    Alert.success(title: 'Este é um alerta legal! $count'),

                  );
                  getIt<AlertAreaCubit>().showAlert(
                    Alert.error(title: 'Este é um alerta legal! $count'),

                  );
                  count++;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
