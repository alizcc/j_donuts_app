import 'package:j_donuts_app/core/database/database_provider.dart';
import 'package:j_donuts_app/features/product/data/drift_product_repository.dart';
import 'package:j_donuts_app/features/product/domain/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) =>
    DriftProductRepository(ref.watch(appDatabaseProvider));
