import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.iconPath,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: t.lightGray);
          }
          return BorderSide(color: t.primary);
        }),
        minimumSize: WidgetStateProperty.all(const Size(128, 54)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return t.lightGray;
          }
          return t.primary;
        }),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      child: Row(
        children: [
          if (iconPath != null)
            const SizedBox(
              width: 24,
            ),
          Expanded(
            child: Center(
              child: Text(label),
            ),
          ),
          if (iconPath != null)
            SvgPicture.asset(
              iconPath!,
              width: 24,
            )
        ],
      ),
    );
  }
}
