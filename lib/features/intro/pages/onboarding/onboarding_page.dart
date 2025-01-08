import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_button.dart';
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
                description:
                'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques.',
                imagePath: 'assets/onboarding/onboarding_2.svg',
              ),
              if(state.showLocationPage)
                OnboardingPageInfo(
                  title: 'Acesso à\n localização',
                  description: 'Para facilitar a busca de profissionais em sua região.',
                  imagePath: 'assets/onboarding/onboarding_0.svg',
                  onNextPressed: cubit.requestLocationPermission
                ),
              if(state.showNotificationPage)
                OnboardingPageInfo(
                  title: 'Ative as\n notificações',
                  description:
                  'Para receber avisos importantes sobre os seus agendamentos.',
                  imagePath: 'assets/onboarding/onboarding_1.svg',
                  onNextPressed: cubit.requestNotificationPermission
                ),
              OnboardingPageInfo(
                title: 'Agende uma\n consulta',
                description:
                'Você poderá encontrar profissionais em sua região e agendar uma consulta com poucos cliques.',
                imagePath: 'assets/onboarding/onboarding_2.svg',
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
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                p.imagePath,
                                height: 300,
                              ),
                              const SizedBox(height: 60),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                child: Text(
                                  p.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                    color: t.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  p.description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                          icon: Icon(Icons.arrow_forward_ios_rounded),
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
    return showDialog(context: context, builder: (_) => const Dialog());
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
    required this.description,
    required this.imagePath,
    this.onNextPressed,
    this.customLabel,
  });

  final String title;
  final String description;
  final String imagePath;
  final String? customLabel;
  final Function? onNextPressed;
}
