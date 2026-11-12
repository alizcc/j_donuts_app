import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/auth/domain/user.dart';

abstract interface class AuthRepository {
  Future<Result<bool>> isRegistered(String phone);

  Future<Result<void>> sendOtp(String phone);

  Future<Result<bool>> verifyOtp({required String phone, required String code});

  Future<Result<User>> register(User user);

  Future<Result<User>> login(String phone);

  Future<Result<void>> logout();

  Future<Result<User?>> currentUser();
}
