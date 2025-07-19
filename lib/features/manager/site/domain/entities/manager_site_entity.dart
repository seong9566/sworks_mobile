class ManagerSiteEntity {
  final int siteSeq;
  final String siteName;
  final int siteTypeSeq;
  final String siteTypeName;
  final String siteTel;
  final String siteAddress;
  final List<ManagerContractEntity> managerContract;

  ManagerSiteEntity({
    required this.siteSeq,
    required this.siteName,
    required this.siteTypeSeq,
    required this.siteTypeName,
    required this.siteTel,
    required this.siteAddress,
    required this.managerContract,
  });
}

class ManagerContractEntity {
  final int contractSeq;
  final int serviceTypeSeq;
  final String serviceTypeName;
  final String contractAmount;
  final String contractStartDt;
  final String contractEndDt;
  final String contractStaff;
  final String contractManager;
  final String comments;
  final bool status;

  ManagerContractEntity({
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
}
