import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_banner.freezed.dart';
part 'home_banner.g.dart';

@freezed
abstract class HomeBanner with _$HomeBanner {
  const factory HomeBanner({
    required String id,
    required String tag,
    required String title,
    required String color,
  }) = _HomeBanner;

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);
}
