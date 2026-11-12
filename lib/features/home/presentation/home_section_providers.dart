import 'package:j_donuts_app/features/auth/data/auth_providers.dart';
import 'package:j_donuts_app/features/home/data/home_providers.dart';
import 'package:j_donuts_app/features/home/domain/home_banner.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';
import 'package:j_donuts_app/features/home/domain/shop.dart';
import 'package:j_donuts_app/features/product/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_section_providers.g.dart';

@riverpod
Stream<List<HomeBanner>> homeBanners(Ref ref) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchBanners();
}

@riverpod
Stream<List<Product>> homeSection(Ref ref, HomeSection section) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchSection(section);
}

@riverpod
Stream<List<Shop>> nearbyShops(Ref ref) async* {
  await ref.watch(catalogSeedProvider.future);
  yield* ref.watch(homeRepositoryProvider).watchShops();
}

@riverpod
Future<String?> signedInFirstName(Ref ref) async {
  final repository = ref.watch(authRepositoryProvider);
  final result = await repository.currentUser();
  return result.fold<String?>((_) => null, (user) => user?.firstName);
}
