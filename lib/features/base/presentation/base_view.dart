import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/calendar/presentation/view/calendar_view.dart';
import 'package:sworks_mobile/features/profile/presentation/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseView extends StatefulWidget {
  final Widget child;
  const BaseView({super.key, required this.child});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final pages = [CalendarView(), ProfileView()];
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  void changeIndex(int index) {
    switch (index) {
      case 0:
        context.goNamed('calendar');
        break;
      case 1:
        context.goNamed('profile');
        break;
      default:
        context.goNamed('calendar');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: widget.child, bottomNavigationBar: _bottomNavBar());
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) => changeIndex(index),
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      // 선택된 라벨은 볼드체로
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12, // 원한다면 글자 크기도 조절
      ),
      // 선택되지 않은 라벨은 일반 두께로
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity),
          label: "Profile",
        ),
      ],
    );
  }
}
