import 'package:app_agendamento/core/widgets/app_card.dart';
import 'package:app_agendamento/features/home/sections/next_schedules/home_next_schedules_cubit.dart';
import 'package:app_agendamento/features/home/sections/next_schedules/widgets/home_next_schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../di/di.dart';
import '../../../scheduling/data/scheduling_repository.dart';

class HomeNextSchedulesSection extends StatefulWidget {
  const HomeNextSchedulesSection({Key? key}) : super(key: key);

  @override
  State<HomeNextSchedulesSection> createState() =>
      _HomeNextSchedulesSectionState();
}

class _HomeNextSchedulesSectionState extends State<HomeNextSchedulesSection> {
  final HomeNextSchedulesCubit cubit = HomeNextSchedulesCubit();


  @override
  void initState() {
    super.initState();

    cubit.loadSchedulings();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return BlocProvider.value(
      value: cubit,
      child: Column(
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
          SizedBox(
            height: 160,
            child: BlocBuilder<HomeNextSchedulesCubit, HomeNextSchedulesState>(
              builder: (context, state) {
                return switch(state.status) {
                  HomeNextSchedulesStatus.loading => Container(),
                  HomeNextSchedulesStatus.error => Container(),
                  HomeNextSchedulesStatus.success => ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, i) => const SizedBox(width: 16),
                      itemCount: state.schedulings!.length,
                      itemBuilder: (_, i) =>
                          SizedBox(
                              width: state.schedulings!.length == 1
                                  ? MediaQuery.sizeOf(context).width - 48
                                  : 270,
                              child: const HomeNextScheduleItem()
                          )
                  ),
                };
              },
            ),
          )
        ],
      ),
    );
  }
}

