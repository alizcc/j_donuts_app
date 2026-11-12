import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    required String imageUrl,
    required String description,
    @Default(false) bool isNew,
    int? discountPercent,
    String? imageAsset,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
