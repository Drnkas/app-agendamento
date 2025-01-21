import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppBasePage extends StatelessWidget {
  const AppBasePage({
    Key? key,
    required this.title,
    required this.body,
    this.bodyPadding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
  }) : super(key: key);

  final String title;
  final Widget body;
  final EdgeInsets bodyPadding;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.paddingOf(context).top + 64 + bodyPadding.top,
                bottom: MediaQuery.paddingOf(context).bottom + bodyPadding.bottom,
                left: bodyPadding.left,
                right: bodyPadding.right,
              ),
              child: body,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(36),
                  ),
                ),
                margin: EdgeInsets.zero,
                elevation: 4,
                shadowColor: t.lightGray,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: t.body16Bold,
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
