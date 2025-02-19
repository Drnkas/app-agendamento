import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/app_theme.dart';

class AppCardShimmer extends StatelessWidget {
  const AppCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: t.gray.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.fromLTRB(24, 0, 24, 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
