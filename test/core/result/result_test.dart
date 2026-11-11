import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/core/result/failure.dart';
import 'package:j_donuts_app/core/result/result.dart';

void main() {
  String describe(Result<int> result) =>
      result.fold((f) => 'failed: ${f.message}', (v) => 'got $v');

  group('Result.fold', () {
    test('runs the success branch with the value', () {
      expect(describe(const Success(1)), 'got 1');
    });

    test('runs the failure branch with the failure', () {
      const failure = NotFoundFailure('missing');
      expect(describe(const Err(failure)), 'failed: missing');
    });
  });
}
