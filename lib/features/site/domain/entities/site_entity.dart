/// 사업장 위치 정보를 나타내는 도메인 엔티티
class SiteEntity {
  final int siteSeq;
  final String siteName;
  final bool isSelected;

  const SiteEntity({
    required this.siteSeq,
    required this.siteName,
    this.isSelected = false,
  });

  /// 선택 상태를 변경한 새 인스턴스 생성
  SiteEntity copyWith({bool? isSelected}) {
    return SiteEntity(
      siteSeq: siteSeq,
      siteName: siteName,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
 