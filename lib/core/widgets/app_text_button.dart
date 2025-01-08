import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(54, 54)),
          overlayColor: WidgetStateProperty.all(t.lightGray),
          textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          foregroundColor: WidgetStateColor.resolveWith((states) {
            if(states.contains(WidgetState.disabled)){
              return t.lightGray;
            } else {
              return t.darkPrimary;
            }
          }),
        ),
        child: Text(label)
    );
  }
}
