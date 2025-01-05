import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => Scaffold(
            body: TextButton(
                onPressed: () => throw Exception(),
                child: const Text('Me aperte')
            )
            ,
          )
      ),
      GoRoute(
          path: '/auth',
          builder: (context, state) => Container(color: Colors.yellow,)
      )
    ]
);