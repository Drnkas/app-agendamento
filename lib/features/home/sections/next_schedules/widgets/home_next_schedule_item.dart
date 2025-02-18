
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../scheduling/models/scheduling.dart';

class HomeNextScheduleItem extends StatelessWidget {
  const HomeNextScheduleItem({super.key, this.scheduling});

  final Scheduling? scheduling;

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return AppCard(
        onPressed: () {},
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: t.lightGray
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      '11 set',
                      style: t.label11Bold.copyWith(color: t.primary),
                    ),

                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Consulta médica',
                        style: t.body16Bold,
                      ),
                    ),
                  ),
                  Text(
                    'Dr. Mário | 8:45 - 9:30',
                    style: t.body13Bold.copyWith(color: t.gray),
                  )
                ],
              ),
            ),
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: t.primary.withOpacity(0.18)
              ),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset('assets/icons/map_pin.svg' ),
            )
          ],
        )
    );
  }
}
