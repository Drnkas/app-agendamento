import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {

  AppSecureStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<String?> getSessionToken() {
    return _secureStorage.read(key: 'sessionToken');
  }
}