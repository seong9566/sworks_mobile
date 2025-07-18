import 'package:flutter/material.dart';
import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_list.dart';
import 'package:sworks_mobile/features/widgets/app_bar.dart';

class SiteEditView extends StatelessWidget {
  final ManagerSite site;
  const SiteEditView({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftBackAppBar(context, '사업장 담당자 변경'),
      body: const Placeholder(),
    );
  }
}
