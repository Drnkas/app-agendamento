import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/intro/pages/splash/splash_page.dart';


final router = GoRouter(
  initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => SplashPage()
      ),
      GoRoute(
          path: '/auth',
          builder: (context, state) => Container(color: Colors.yellow,)
      )
    ]
);