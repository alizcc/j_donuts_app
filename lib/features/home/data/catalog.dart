import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';

typedef JsonMap = Map<String, dynamic>;

class Catalog {
  const Catalog({
    required this.member,
    required this.banners,
    required this.products,
    required this.sections,
    required this.shops,
    this.challenges = const [],
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
    challenges: _list(json['challenges'], Challenge.fromJson),
  );

  final Member member;
  final List<HomeBanner> banners;
  final List<Product> products;
  final Map<HomeSection, List<String>> sections;
  final List<Shop> shops;
  final List<Challenge> challenges;

  static List<T> _list<T>(Object? json, T Function(JsonMap) fromJson) => [
    for (final item in json! as List<dynamic>) fromJson(item as JsonMap),
  ];
}
