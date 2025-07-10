import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/auth/presentation/providers/auth_providers_di.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:sworks_mobile/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    DioClient.onLogout = () {
      ref.read(authRepositoryProvider).logout();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
