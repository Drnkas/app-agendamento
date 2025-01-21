import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.onChanged,
    this.textInputType,
    this.initialText,
    this.obscure = false,
    this.inputFormatters,
  });

  final String title;
  final String hint;
  final String? initialText;
  final Function(String) onChanged;
  final TextInputType? textInputType;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: t.lightGray,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.start,
                    style: t.label11Bold,
                  ),
                ),
                TextFormField(
                  initialValue: widget.initialText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(20, 6, 20, 14),
                    isCollapsed: true,
                    hintText: widget.hint,
                    hintStyle: t.field15.copyWith(color: t.gray),
                  ),
                  style: t.field15,
                  onChanged: widget.onChanged,
                  keyboardType: widget.textInputType,
                  obscureText: widget.obscure && hidePassword,
                  inputFormatters: widget.inputFormatters,
                ),
              ],
            ),
          ),
          if (widget.obscure)
            SizedBox(
              width: 48,
              height: 48,
              child: Material(
                type: MaterialType.transparency,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
                  color: t.gray,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
