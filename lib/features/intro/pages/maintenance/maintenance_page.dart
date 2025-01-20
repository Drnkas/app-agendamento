import 'package:app_agendamento/features/intro/widgets/intro_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/device/app_external_launcher.dart';
import '../../../../di/di.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: IntroBasePage(
              imagePath: 'assets/intro/maintenance.svg',
              title: 'Aplicativo em\n Manutenção',
              body:
              'Nosso app está passando por melhorias. Acompanhe nossas redes sociais para receber novidades!',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      getIt<AppExternalLauncher>()
                          .launchUrl('https://twitter.com');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/social/twitter.svg',
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/social/instagram.svg',
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/social/facebook.svg',
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
