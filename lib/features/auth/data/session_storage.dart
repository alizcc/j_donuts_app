import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {
  const SessionStorage(this._storage);

  static const String _phoneKey = 'session_phone';

  final FlutterSecureStorage _storage;

  Future<void> savePhone(String phone) =>
      _storage.write(key: _phoneKey, value: phone);

  Future<String?> readPhone() => _storage.read(key: _phoneKey);

  Future<void> clear() => _storage.delete(key: _phoneKey);
}
