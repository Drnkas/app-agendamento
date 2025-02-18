import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.onPressed, required this.child, this.width});

  final VoidCallback? onPressed;
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Container(
      width: width,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(6, 12),
                blurRadius: 15,
                spreadRadius: 0,
                color: t.black.withOpacity(0.08)
            )
          ]
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          highlightColor: t.primary.withOpacity(0.1),
          splashColor: t.primary.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    )
    ;
  }
}
