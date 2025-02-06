import 'dart:isolate';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class AppCrashlytics {

  AppCrashlytics(this._crashlytics) {
    _configureCrashlytics();
  }

  final FirebaseCrashlytics _crashlytics;

  void _configureCrashlytics() async {
    await _crashlytics.setCrashlyticsCollectionEnabled(true);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };

    Isolate.current.addErrorListener(RawReceivePort((pair) async{
      final List<dynamic> errorAndStackTrace = pair;
      await _crashlytics.recordError(
          errorAndStackTrace.first,
          errorAndStackTrace.last
      );
    }).sendPort);
  }

}
