import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/widgets/app_bar.dart';
import 'package:sworks_mobile/features/widgets/default_input_field.dart';
import 'package:sworks_mobile/features/widgets/default_select_button.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../widgets/default_button.dart';
import '../domain/entities/manager_site_list.dart';

class SiteEditView extends ConsumerStatefulWidget {
  final ManagerSite site;
  const SiteEditView({super.key, required this.site});

  @override
  ConsumerState<SiteEditView> createState() => _SiteEditViewState();
}

class _SiteEditViewState extends ConsumerState<SiteEditView> {
  late TextEditingController siteNameController;
  late TextEditingController siteAddressController;
  late TextEditingController siteTelController;

  @override
  void initState() {
    siteNameController = TextEditingController(text: widget.site.siteName);
    siteAddressController = TextEditingController(
      text: widget.site.siteAddress,
    );
    siteTelController = TextEditingController(text: widget.site.siteTel);
    super.initState();
  }

  @override
  void dispose() {
    siteNameController.dispose();
    siteAddressController.dispose();
    siteTelController.dispose();
    super.dispose();
  }

  void selectSiteMemberBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController searchController = TextEditingController();

        return Container(
          padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 24),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Divider(
                  color: grayBorderColor,
                  thickness: 4,
                  radius: BorderRadius.all(Radius.circular(8)),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '담당자 선택',
                    style: TextStyle(
                      color: descriptionDarkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    icon: Icon(
                      Icons.close,
                      color: descriptionDarkColor,
                      size: 24,
                    ),
                    onPressed: () => context.pop(context),
                  ),
                ],
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: leftBackAppBar(context, '담당자 변경'),
      body: _body(),
      bottomNavigationBar: _saveButton(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultInputField(
              hintText: siteNameController.text,
              controller: siteNameController,
              isReadOnly: true,
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderGrayColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.site.siteTypeName,
                style: TextStyle(
                  color: descriptionDarkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            DefaultInputField(
              hintText: siteAddressController.text,
              controller: siteAddressController,
              isReadOnly: true,
            ),
            SizedBox(height: 16),
            DefaultInputField(
              hintText: siteTelController.text,
              controller: siteTelController,
              isReadOnly: true,
            ),
            SizedBox(height: 16),
            DefaultSelectButton(
              onTap: selectSiteMemberBottomSheet,
              title: '담당 인원 : 총 5명',
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: DefaultButton(text: '저장', onPressed: () {}),
    );
  }
}
