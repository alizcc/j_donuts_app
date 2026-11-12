import 'package:j_donuts_app/features/product/domain/product.dart';

abstract interface class ProductRepository {
  Stream<Product?> watchProduct(String id);
}
