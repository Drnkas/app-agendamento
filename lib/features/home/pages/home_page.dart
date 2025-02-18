import 'package:app_agendamento/features/auth/session/session_cubit.dart';
import 'package:app_agendamento/features/home/sections/home_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../sections/next_schedules/home_next_schedules_section.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    final AppTheme t = context.watch();

    return Scaffold(
      body: Column(
        children: [
          const HomeHeaderSection(),
          Expanded(
              child: ListView(
                children: const [
                  HomeNextSchedulesSection()
                ],
              )
          )


        ],
      ),
    );
  }
}
