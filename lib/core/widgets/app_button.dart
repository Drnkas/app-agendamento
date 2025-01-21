import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppButton extends StatefulWidget {
  const AppButton({super.key, required this.label, this.onPressed, this.icon});

  final String label;
  final VoidCallback? onPressed;
  final Icon? icon;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if(states.contains(WidgetState.disabled)){
            return t.light;
          } else {
            return t.primary;
          }
        }),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        minimumSize: WidgetStateProperty.all(const Size(128, 54)),
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if(states.contains(WidgetState.disabled)){
            return t.lightGray;
          } else {
            return Colors.white;
          }
        }),
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.icon != null)
              const SizedBox(width: 24),

            Expanded(child: Center(child: Text(widget.label))),

            if (widget.icon != null)
              widget.icon!,
          ]
      ),
    );
  }
}
