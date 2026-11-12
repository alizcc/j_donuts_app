import 'package:j_donuts_app/features/home/data/catalog.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

Product testProduct(String id, {int priceMmk = 3200}) => Product(
  id: id,
  code: 'JD$id',
  name: 'Donut $id',
  priceMmk: priceMmk,
  imageUrl: 'https://example.com/$id.png',
  description: 'A donut',
);

Catalog testCatalog({List<Product>? products}) {
  final items = products ?? [testProduct('a'), testProduct('b')];
  return Catalog(
    member: const Member(
      id: 'me',
      tier: MemberTier.silver,
      points: 680000,
      nextTierPoints: 680500,
    ),
    banners: const [
      HomeBanner(id: 'b1', tag: 'New', title: 'Hello', color: 'cyan'),
    ],
    products: items,
    sections: {
      HomeSection.popular: [for (final product in items) product.id],
    },
    shops: const [
      Shop(id: 's1', name: 'Shop', address: 'Yangon', color: 'pink'),
    ],
  );
}
