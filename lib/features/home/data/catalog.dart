import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

typedef JsonMap = Map<String, dynamic>;

// Everything Home, Product detail and Rewards show, in one snapshot. Both the
// bundled seed and the remote source deliver data in this shape.
class Catalog {
  const Catalog({
    required this.member,
    required this.banners,
    required this.products,
    required this.sections,
    required this.shops,
  });

  factory Catalog.fromJson(JsonMap json) => Catalog(
    member: Member.fromJson(json['member'] as JsonMap),
    banners: _list(json['banners'], HomeBanner.fromJson),
    products: _list(json['products'], Product.fromJson),
    sections: {
      for (final section in json['sections'] as List<dynamic>)
        HomeSection.values.byName((section as JsonMap)['key'] as String):
            List<String>.from(section['productIds'] as List<dynamic>),
    },
    shops: _list(json['shops'], Shop.fromJson),
  );

  final Member member;
  final List<HomeBanner> banners;
  final List<Product> products;
  final Map<HomeSection, List<String>> sections;
  final List<Shop> shops;

  static List<T> _list<T>(Object? json, T Function(JsonMap) fromJson) => [
    for (final item in json! as List<dynamic>) fromJson(item as JsonMap),
  ];
}
