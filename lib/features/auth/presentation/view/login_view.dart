import 'package:sworks_mobile/core/theme/app_theme.dart' as AppTheme;
import 'package:sworks_mobile/features/auth/presentation/providers/auth_providers_di.dart'; // 경로 수정
import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart'; // 경로 및 타입 수정
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/auth/presentation/view/widgets/auth_input_field.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final userIdController = TextEditingController(
    // 관리자 유저
    text: "2531590000",
    // 일반 유저
    // text: "123456789",
  ); // 테스트용 기본값
  final passwordController = TextEditingController(
    text: "stecdev1234!",
  ); // 테스트용 기본값
  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ViewModel과 State 참조 변경
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final loginState = ref.watch(loginViewModelProvider);
    final siteVM = ref.read(siteSelectionViewModelProvider.notifier);

    ref.listen<LoginStatus>(loginViewModelProvider, (previous, next) {
      // 로그인 성공 시 캘린더 화면으로 이동
      if (next.loginStatus == LoginStatusEnum.user) {
        siteVM.addsiteLocation(LoginStatusEnum.user);
        context.goNamed('calendar');
      } else if (next.loginStatus == LoginStatusEnum.manager) {
        // 로그인이 매니저라면, 사업장 선택 화면
        context.goNamed('site-selection');
      } else if (next.loginStatus == LoginStatusEnum.changePwd) {
        // 비밀번호 변경 화면
        context.pushNamed('password-change');
      } else if (next.loginStatus == LoginStatusEnum.loading) {
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage ?? "")));
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 1),
            Text(
              'S-TEC',
              style: TextStyle(
                fontSize: 42,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AuthInputField(
                    hintText: '아이디',
                    controller: userIdController,
                  ), // 한글 힌트
                  const SizedBox(height: 16),
                  AuthInputField(
                    hintText: '비밀번호',
                    controller: passwordController,
                    isPassword: true,
                  ), // 한글 힌트
                  const SizedBox(height: 16),
                  _loginButton(loginVM, loginState), // ViewModel과 State 전달
                ],
              ),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(
    LoginViewModel vm,
    LoginStatus state, // 타입 변경
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(AppTheme.primaryColor),
        ),
        onPressed:
            state.loginStatus ==
                LoginStatusEnum
                    .loading // 로딩 중일 때 버튼 비활성화
            ? null
            : () {
                // context.go('/calendar');
                vm.login(userIdController.text, passwordController.text);
              },
        child:
            state.loginStatus ==
                LoginStatusEnum
                    .loading // 로딩 상태 확인 변경
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                '로그인',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ), // 한글 및 스타일 추가
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(
        'S-TEC 로그인', // 타이틀 변경
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }}
