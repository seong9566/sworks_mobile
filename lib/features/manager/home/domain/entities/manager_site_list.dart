import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_entity.dart';

class ManagerSite {
  final int siteSeq;
  final String siteName;
  final int siteTypeSeq;
  final String siteTypeName;
  final String siteTel;
  final String siteAddress;

  final List<ManagerContractList> managerContract;
  const ManagerSite({
    required this.siteSeq,
    required this.siteName,
    required this.siteTypeSeq,
    required this.siteTypeName,
    required this.siteTel,
    required this.siteAddress,
    required this.managerContract,
  });

  //init
  factory ManagerSite.init() {
    return ManagerSite(
      siteSeq: 0,
      siteName: '',
      siteTypeSeq: 0,
      siteTypeName: '',
      siteTel: '',
      siteAddress: '',
      managerContract: [],
    );
  }
  // 도메인 엔티티에서 변환
  factory ManagerSite.fromEntity(ManagerSiteEntity entity) {
    return ManagerSite(
      siteSeq: entity.siteSeq,
      siteName: entity.siteName,
      siteTypeSeq: entity.siteTypeSeq,
      siteTypeName: entity.siteTypeName,
      siteTel: entity.siteTel,
      siteAddress: entity.siteAddress,
      managerContract: entity.managerContract
          .map((contract) => ManagerContractList.fromEntity(contract))
          .toList(),
    );
  }

  //
  String get contractServiceTypeNames =>
      managerContract.map((contract) => contract.serviceTypeName).join(",");
}

class ManagerContractList {
  final String contractSeq;
  final String serviceTypeSeq;
  final String serviceTypeName;
  final String contractAmount;
  final String contractStartDt;
  final String contractEndDt;
  final String contractStaff;
  final String contractManager;
  final String comments;
  final String status;
  const ManagerContractList({
    required this.contractSeq,
    required this.serviceTypeSeq,
    required this.serviceTypeName,
    required this.contractAmount,
    required this.contractStartDt,
    required this.contractEndDt,
    required this.contractStaff,
    required this.contractManager,
    required this.comments,
    required this.status,
  });

  //init
  factory ManagerContractList.init() {
    return ManagerContractList(
      contractSeq: '',
      serviceTypeSeq: '',
      serviceTypeName: '',
      contractAmount: '',
      contractStartDt: '',
      contractEndDt: '',
      contractStaff: '',
      contractManager: '',
      comments: '',
      status: '',
    );
  }
  // 도메인 엔티티에서 변환
  factory ManagerContractList.fromEntity(ManagerContractEntity entity) {
    return ManagerContractList(
      contractSeq: entity.contractSeq,
      serviceTypeSeq: entity.serviceTypeSeq,
      serviceTypeName: entity.serviceTypeName,
      contractAmount: entity.contractAmount,
      contractStartDt: entity.contractStartDt,
      contractEndDt: entity.contractEndDt,
      contractStaff: entity.contractStaff,
      contractManager: entity.contractManager,
      comments: entity.comments,
      status: entity.status,
    );
  }
}
