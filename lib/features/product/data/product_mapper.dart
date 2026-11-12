import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

extension ProductRowMapper on ProductRow {
  Product toProduct() => Product(
    id: id,
    code: code,
    name: name,
    priceMmk: priceMmk,
    isNew: isNew,
    discountPercent: discountPercent,
    imageUrl: imageUrl,
    imageAsset: imageAsset,
    description: description,
  );
}
