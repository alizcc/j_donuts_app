import 'package:j_donuts_app/core/result/result.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';

abstract interface class HomeRepository {
  Stream<List<HomeBanner>> watchBanners();

  Stream<List<Product>> watchSection(HomeSection section);

  Stream<List<Shop>> watchShops();

  Future<Result<void>> refresh();
}
