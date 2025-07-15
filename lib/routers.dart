import 'package:sworks_mobile/features/auth/presentation/view/password_change_view.dart';
import 'package:sworks_mobile/features/system_manager/presentation/view/system_manager_home_view.dart';
import 'package:sworks_mobile/features/base/presentation/base_view.dart';
import 'package:sworks_mobile/features/site/presentation/view/selete_site_view.dart';
import 'package:sworks_mobile/features/calendar/presentation/view/calendar_view.dart';
import 'package:sworks_mobile/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/profile/presentation/profile_view.dart';

// routes.dart
final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  // initialLocation: '/login',
  initialLocation: '/system-manager',
  routes: [
    // 로그인 화면
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginView(),
    ),
    // 비밀번호 변경
    GoRoute(
      path: '/password-change',
      name: 'password-change',
      builder: (context, state) => PasswordChangeView(),
    ),
    // 사업장 선택
    GoRoute(
      path: '/site-selection',
      name: 'site-selection',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: SeleteSiteView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final tween = Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    ),

    // [메인 레이아웃]
    ShellRoute(
      navigatorKey: shellNavKey,
      builder: (context, state, child) {
        return BaseView(child: child);
      },
      routes: [
        GoRoute(
          path: '/system-manager',
          name: 'system-manager',
          builder: (context, state) => const SystemManagerHomeView(),
        ),

        // /calendar → 달력 탭
        GoRoute(
          path: '/calendar',
          name: 'calendar',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: CalendarView()),
          // pageBuilder: (context, state) =>
          //     NoTransitionPage(child: CustomCalendarView()),
        ),
        // /profile → 프로필 탭
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProfileView()),
          // Profile 내부 하위 페이지가 있다면 아래 routes에 더 작성하면 됌.
          // routes: [],
        ),
      ],
    ),
  ],
);
