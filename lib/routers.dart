import 'package:sworks_mobile/features/auth/presentation/view/password_change_view.dart';
import 'package:sworks_mobile/features/manager/features/home/presentation/view/system_manager_home_view.dart';
import 'package:sworks_mobile/features/base/presentation/base_view.dart';
import 'package:sworks_mobile/features/site/presentation/view/selete_site_view.dart';
import 'package:sworks_mobile/features/calendar/presentation/view/calendar_view.dart';
import 'package:sworks_mobile/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/manager/features/site_edit/view/site_edit_view.dart';

import 'features/profile/presentation/profile_view.dart';

// routes.dart
final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> systemManagerNavKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavKey,
  initialLocation: '/login',
  routes: [
    // 인증 관련 라우트 (ShellRoute 외부)
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/password-change',
      name: 'password-change',
      builder: (context, state) => PasswordChangeView(),
    ),
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

    // [시스템 관리자용 ShellRoute]
    ShellRoute(
      navigatorKey: systemManagerNavKey,
      builder: (context, state, child) {
        return child; // 시스템 관리자는 별도의 Shell이 필요 없음
      },
      routes: [
        GoRoute(
          path: '/system-manager-home',
          name: 'system-manager-home',
          builder: (context, state) => const SystemManagerHomeView(),
          routes: [
            GoRoute(
              path: 'site-edit',
              name: 'site-edit',
              builder: (context, state) => const SiteEditView(),
            ),
            // 시스템 관리자의 다른 하위 라우트들...
          ],
        ),
      ],
    ),

    // [일반 사용자용 ShellRoute]
    ShellRoute(
      navigatorKey: shellNavKey,
      builder: (context, state, child) {
        return BaseView(child: child); // 일반 사용자는 BaseView를 통해 표시
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const CalendarView(), // 일반 사용자의 홈 화면
        ),
        GoRoute(
          path: '/calendar',
          name: 'calendar',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: CalendarView()),
        ),
        GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProfileView()),
          // Profile 내부 하위 페이지가 있다면 아래 routes에 더 작성
          // routes: [],
        ),
      ],
    ),
  ],
);
