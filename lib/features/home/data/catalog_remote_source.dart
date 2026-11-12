import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:j_donuts_app/features/home/data/catalog.dart';

abstract interface class CatalogRemoteSource {
  Future<Catalog> fetchCatalog();
}

// Stands in for a real API: waits like a network call, then returns a
// bundled "server" response that differs a little from the seed.
class FakeCatalogRemoteSource implements CatalogRemoteSource {
  FakeCatalogRemoteSource({AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  static const String responseAsset = 'assets/seed/catalog_remote.json';
  static const Duration fakeLatency = Duration(seconds: 1);

  final AssetBundle _bundle;

  @override
  Future<Catalog> fetchCatalog() async {
    await Future<void>.delayed(fakeLatency);
    final json = await _bundle.loadString(responseAsset);
    return Catalog.fromJson(jsonDecode(json) as JsonMap);
  }
}
