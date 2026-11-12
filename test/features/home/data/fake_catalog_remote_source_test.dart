import 'package:flutter_test/flutter_test.dart';
import 'package:j_donuts_app/features/home/data/catalog_remote_source.dart';
import 'package:j_donuts_app/features/home/domain/home_section.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('remote response adds Classic Glazed to the front of Popular', () async {
    final catalog = await FakeCatalogRemoteSource().fetchCatalog();

    expect(catalog.sections[HomeSection.popular]!.first, 'p_glazed');
    expect(catalog.products.map((product) => product.id), contains('p_glazed'));
  });
}
