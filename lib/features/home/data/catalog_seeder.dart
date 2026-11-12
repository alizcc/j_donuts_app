import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:j_donuts_app/features/home/data/catalog.dart';
import 'package:j_donuts_app/features/home/data/catalog_store.dart';

class CatalogSeeder {
  CatalogSeeder(this._store, {AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  static const String seedAsset = 'assets/seed/catalog.json';

  final CatalogStore _store;
  final AssetBundle _bundle;

  Future<void> seedIfEmpty() async {
    if (!await _store.isEmpty()) return;
    final json = await _bundle.loadString(seedAsset);
    await _store.save(Catalog.fromJson(jsonDecode(json) as JsonMap));
  }
}
