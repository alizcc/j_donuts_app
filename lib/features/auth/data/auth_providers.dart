import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/features/auth/data/fake_auth_repository.dart';
import 'package:j_donuts_app/features/auth/data/session_storage.dart';
import 'package:j_donuts_app/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
SessionStorage sessionStorage(Ref ref) =>
    const SessionStorage(FlutterSecureStorage());

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => FakeAuthRepository(
  database: ref.watch(appDatabaseProvider),
  sessionStorage: ref.watch(sessionStorageProvider),
);
