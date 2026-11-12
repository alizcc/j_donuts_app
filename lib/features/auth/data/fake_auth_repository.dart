import 'package:drift/drift.dart' show Value;
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/core/result/failure.dart';
import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/auth/data/session_storage.dart';
import 'package:j_donuts_app/features/auth/domain/auth_repository.dart';
import 'package:j_donuts_app/features/auth/domain/user.dart';

// Fake backend: ~1s delay, OTP is always [123456].
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({
    required AppDatabase database,
    required SessionStorage sessionStorage,
  }) : _database = database,
       _session = sessionStorage;

  static const String fakeOtpCode = '123456';
  static const Duration fakeLatency = Duration(seconds: 1);

  final AppDatabase _database;
  final SessionStorage _session;

  @override
  Future<Result<bool>> isRegistered(String phone) =>
      _run(() async => await _findUser(phone) != null);

  @override
  Future<Result<void>> sendOtp(String phone) => _run(() async {});

  @override
  Future<Result<bool>> verifyOtp({
    required String phone,
    required String code,
  }) => _run(() async => code == fakeOtpCode);

  @override
  Future<Result<User>> register(User user) => _run(() async {
    await _database
        .into(_database.users)
        .insertOnConflictUpdate(
          UsersCompanion.insert(
            phone: user.phone,
            firstName: user.firstName,
            lastName: Value(user.lastName),
            dateOfBirth: user.dateOfBirth,
          ),
        );
    await _session.savePhone(user.phone);
    return user;
  });

  @override
  Future<Result<User>> login(String phone) async {
    final result = await _run(() async {
      final user = await _findUser(phone);
      if (user != null) await _session.savePhone(phone);
      return user;
    });
    return switch (result) {
      Success(value: final User user) => Success(user),
      Success() => const Err(NotFoundFailure('Phone number not registered')),
      Err(:final failure) => Err(failure),
    };
  }

  @override
  Future<Result<void>> logout() => _run(_session.clear);

  @override
  Future<Result<User?>> currentUser() => _run(simulateLatency: false, () async {
    final phone = await _session.readPhone();
    if (phone == null) return null;
    return await _findUser(phone);
  });

  Future<User?> _findUser(String phone) async {
    final query = _database.select(_database.users)
      ..where((row) => row.phone.equals(phone));
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return User(
      phone: row.phone,
      firstName: row.firstName,
      lastName: row.lastName,
      dateOfBirth: row.dateOfBirth,
    );
  }

  Future<Result<T>> _run<T>(
    Future<T> Function() action, {
    bool simulateLatency = true,
  }) async {
    if (simulateLatency) await Future<void>.delayed(fakeLatency);
    try {
      return Success(await action());
    } on Exception catch (error) {
      return Err(StorageFailure('Could not reach local storage', cause: error));
    }
  }
}
