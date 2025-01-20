import 'package:app_agendamento/core/device/app_device_settings.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/core/widgets/app_dialog_alert.dart';
import 'package:app_agendamento/core/widgets/app_outlined_button.dart';
import 'package:app_agendamento/di/di.dart';
import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../widgets/intro_base_page.dart';
import 'onboarding_page_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> implements OnboardingPageActions{
  final PageController pageController = PageController();
  late OnboardingPageCubit cubit = OnboardingPageCubit(this);

  int page = 0;

  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }


  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: BlocBuilder<OnboardingPageCubit, OnboardingPageState>(
          builder: (context, state) {

            final pages = [
              OnboardingPageInfo(
                title: 'Seja Bem-vindo(a)!',
                body:
                'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques.',
                imagePath: 'assets/intro/onboarding_2.svg',
              ),
              if(state.showLocationPage)
                OnboardingPageInfo(
                    title: 'Acesso à\n localização',
                    body: 'Para facilitar a busca de profissionais em sua região.',
                    imagePath: 'assets/intro/onboarding_0.svg',
                    onNextPressed: cubit.requestLocationPermission
                ),
              if(state.showNotificationPage)
                OnboardingPageInfo(
                    title: 'Ative as\n notificações',
                    body:
                    'Para receber avisos importantes sobre os seus agendamentos.',
                    imagePath: 'assets/intro/onboarding_1.svg',
                    onNextPressed: cubit.requestNotificationPermission
                ),
              OnboardingPageInfo(
                  title: 'Agende uma\n consulta',
                  body:
                  'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques.',
                  imagePath: 'assets/intro/onboarding_2.svg',
                  onNextPressed: cubit.finish,
                  customLabel: 'Finalizar'
              ),
            ];

            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (final p in pages)
                        IntroBasePage(
                          imagePath: p.imagePath,
                          title: p.title,
                          body: p.body,
                        ),
                    ],
                    onPageChanged: (p) {
                      setState(() {
                        page = p;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 44),
                  child: Row(
                    children: [
                      if (page > 0) ...[
                        AppTextButton(
                          label: 'Voltar',
                          onPressed: () {
                            pageController.animateToPage(
                              page - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                      ],
                      Expanded(
                        child: AppButton(
                          label: pages[page].customLabel ?? 'Próximo',
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () async {
                            await pages[page].onNextPressed?.call();

                            pageController.animateToPage(
                              page + 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Future<void> showDeniedForeverDialog() {
    return showDialog(context: context, builder: (_) => AppAlertDialog(
        title: 'Autorização negada',
        body: 'Você não autorizou esta permissão. Acesse as configurações do seu dispositivo para permitir.',
        actions: [
          AppOutlinedButton(
              label: 'Prosseguir mesmo assim',
              onPressed: Navigator.of(context).pop
          ),
          AppButton(
              label: 'Ir para as configurações',
              onPressed: () async {
                await getIt<AppDeviceSettings>().openSettings();
                if(context.mounted) Navigator.of(context).pop();
              }
          )
        ]
    ));
  }

  @override
  void dispose() {
    super.dispose();
    cubit.dispose();
    cubit.close();
    pageController.dispose();
  }

  @override
  void navToAuth() {
    context.go(AppRoutes.auth);
  }
}

class OnboardingPageInfo {
  OnboardingPageInfo({
    required this.title,
    required this.body,
    required this.imagePath,
    this.onNextPressed,
    this.customLabel,
  });

  final String title;
  final String body;
  final String imagePath;
  final String? customLabel;
  final Function? onNextPressed;
}
