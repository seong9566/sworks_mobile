import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_response_model.freezed.dart';
part 'site_response_model.g.dart';

@freezed
class SiteResponseModel with _$SiteResponseModel {
  const factory SiteResponseModel({
    required int siteSeq,
    required String siteName,
  }) = _SiteResponseModel;

  factory SiteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SiteResponseModelFromJson(json);

  static List<SiteResponseModel> emptyList() {
    return [SiteResponseModel(siteSeq: 0, siteName: '')];
  }
}

extension SiteResponseModelExtension on SiteResponseModel {
  SiteEntity toEntity() =>
      SiteEntity(siteSeq: siteSeq, siteName: siteName, isSelected: false);
}
