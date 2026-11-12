import 'package:drift/drift.dart';
import 'package:j_donuts_app/core/database/app_database.dart';
import 'package:j_donuts_app/features/home/data/catalog.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/member/domain/member.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:j_donuts_app/features/rewards/domain/challenge.dart';

class CatalogStore {
  const CatalogStore(this._database);

  final AppDatabase _database;

  // v2 installs have no challenges yet, so seed again
  Future<bool> isEmpty() async =>
      await _database.products.count().getSingle() == 0 ||
      await _database.challenges.count().getSingle() == 0;

  Future<void> save(Catalog catalog) => _database.transaction(() async {
    await _clear();
    await _database.batch((batch) {
      batch
        ..insertAll(_database.products, catalog.products.map(_productRow))
        ..insertAll(_database.banners, _indexed(catalog.banners, _bannerRow))
        ..insertAll(_database.shops, _indexed(catalog.shops, _shopRow))
        ..insertAll(_database.sectionItems, _sectionRows(catalog))
        ..insert(_database.members, _memberRow(catalog.member))
        ..insertAll(
          _database.challenges,
          _indexed(catalog.challenges, _challengeRow),
        );
    });
  });

  Future<void> _clear() async {
    await _database.delete(_database.sectionItems).go();
    await _database.delete(_database.products).go();
    await _database.delete(_database.banners).go();
    await _database.delete(_database.shops).go();
    await _database.delete(_database.members).go();
    await _database.delete(_database.challenges).go();
  }

  Iterable<R> _indexed<T, R>(List<T> items, R Function(T, int) toRow) =>
      items.indexed.map((entry) => toRow(entry.$2, entry.$1));

  Iterable<SectionItemsCompanion> _sectionRows(Catalog catalog) =>
      catalog.sections.entries.expand(
        (entry) => entry.value.indexed.map(
          (item) => SectionItemsCompanion.insert(
            section: entry.key,
            productId: item.$2,
            position: item.$1,
          ),
        ),
      );

  ProductsCompanion _productRow(Product product) => ProductsCompanion.insert(
    id: product.id,
    code: product.code,
    name: product.name,
    priceMmk: product.priceMmk,
    isNew: Value(product.isNew),
    discountPercent: Value(product.discountPercent),
    imageUrl: product.imageUrl,
    imageAsset: Value(product.imageAsset),
    description: product.description,
  );

  BannersCompanion _bannerRow(HomeBanner banner, int position) =>
      BannersCompanion.insert(
        id: banner.id,
        tag: banner.tag,
        title: banner.title,
        color: banner.color,
        position: position,
      );

  ShopsCompanion _shopRow(Shop shop, int position) => ShopsCompanion.insert(
    id: shop.id,
    name: shop.name,
    address: shop.address,
    color: shop.color,
    position: position,
  );

  MembersCompanion _memberRow(Member member) => MembersCompanion.insert(
    id: member.id,
    tier: member.tier,
    points: member.points,
    nextTierPoints: member.nextTierPoints,
    tierStartPoints: Value(member.tierStartPoints),
    notificationCount: member.notificationCount,
    rewardCount: member.rewardCount,
  );

  ChallengesCompanion _challengeRow(Challenge challenge, int position) =>
      ChallengesCompanion.insert(
        id: challenge.id,
        tab: challenge.tab,
        title: challenge.title,
        points: challenge.points,
        progress: challenge.progress,
        goal: challenge.goal,
        art: challenge.art,
        position: position,
      );
}
