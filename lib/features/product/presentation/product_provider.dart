import 'package:j_donuts_app/features/home/data/home_providers.dart';
import 'package:j_donuts_app/features/product/data/product_providers.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
Stream<Product?> product(Ref ref, String id) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(productRepositoryProvider).watchProduct(id);
}
