import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_entity.dart';

part 'manager_site_response_model.g.dart';
part 'manager_site_response_model.freezed.dart';

@freezed
class ManagerSiteResponseModel with _$ManagerSiteResponseModel {
  const factory ManagerSiteResponseModel({
    required int siteSeq,
    required String siteName,
    required int siteTypeSeq,
    required String siteTypeName,
    required String siteTel,
    required String siteAddress,
    required List<ContractModel> contracts,
  }) = _ManagerSiteResponseModel;

  factory ManagerSiteResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ManagerSiteResponseModelFromJson(json);
}

@freezed
class ContractModel with _$ContractModel {
  const factory ContractModel({
    required int contractSeq,
    required int serviceTypeSeq,
    required String serviceTypeName,
    int? contractAmount,
    required String contractStartDt,
    required String contractEndDt,
    required String contractStaff,
    required String contractManager,
    String? comments,
    required bool status,
  }) = _ContractModel;

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);
}

/// ManagerSiteResponseModel 확장 메서드
extension ManagerSiteResponseModelX on ManagerSiteResponseModel {
  /// 데이터 모델을 도메인 엔티티로 변환
  ManagerSiteEntity toEntity() {
    return ManagerSiteEntity(
      siteSeq: siteSeq,
      siteName: siteName,
      siteTypeSeq: siteTypeSeq,
      siteTypeName: siteTypeName,
      siteTel: siteTel,
      siteAddress: siteAddress,
      managerContract: contracts
          .map((contract) => contract.toEntity())
          .toList(),
    );
  }
}

/// ContractModel 확장 메서드
extension ContractModelX on ContractModel {
  /// 데이터 모델을 도메인 엔티티로 변환
  ManagerContractEntity toEntity() {
    return ManagerContractEntity(
      contractSeq: contractSeq.toString(),
      serviceTypeSeq: serviceTypeSeq.toString(),
      serviceTypeName: serviceTypeName,
      contractAmount: contractAmount?.toString() ?? '',
      contractStartDt: contractStartDt,
      contractEndDt: contractEndDt,
      contractStaff: contractStaff,
      contractManager: contractManager,
      comments: comments ?? '',
      status: status.toString(),
    );
  }
}
