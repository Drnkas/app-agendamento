import 'package:app_agendamento/features/auth/session/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';

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
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: context.read<SessionCubit>().logout,
                      icon: const Icon(Icons.menu),
                      iconSize: 33,
                      color: t.black
                  ),
                  const SizedBox(width: 18),
                  BlocBuilder<SessionCubit, SessionState>(
                    builder: (context, state) {
                      return Text(
                        'Olá, ${state.loggedUser?.fullname ?? 'visitante'}',
                        style: t.heading24Bold,
                      );
                    },
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
