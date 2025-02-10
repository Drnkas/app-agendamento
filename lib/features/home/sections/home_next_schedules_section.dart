
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_button.dart';
import '../../../di/di.dart';
import '../../scheduling/data/scheduling_repository.dart';

class HomeNextSchedulesSection extends StatelessWidget {
  const HomeNextSchedulesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Próximos agendamentos',
            style: t.body16Bold,
          ),
        ),
        const SizedBox(height: 10),
        AppButton(
          label: 'Testar',
          onPressed: () async {
            final SchedulingRepository repository = getIt();
            final schedules = await repository.getUserSchedules();
            print(schedules);
          },
        ),
      ],
    );
  }
}

