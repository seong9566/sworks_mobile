import 'package:logger/logger.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/auth/presentation/providers/auth_providers_di.dart'; 
import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/auth/presentation/view/widgets/auth_input_field.dart';
import 'package:sworks_mobile/features/widgets/default_button.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final userIdController = TextEditingController(
    // 관리자 
    text: "253159",
    // 일반
    // text: "253161",
  ); 
  final passwordController = TextEditingController(
    text: "stecdev1234!",
  ); 
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
      
      // 시스템 관리자
      if (next.loginStatus == LoginStatusEnum.systemManager) {
        Logger().d("시스템 관리자");
        return;
      }

      /// 유저(담당자, 미화 여사님들)
      if (next.loginStatus == LoginStatusEnum.user) {
        siteVM.addsiteLocation(LoginStatusEnum.user);
        context.goNamed('calendar');
        return;
      }

      

      if (next.loginStatus == LoginStatusEnum.manager) {
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
            logo(),
            _inputForm(loginVM, loginState),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  Image logo() => Image.asset("assets/img/sworks_logo.png", width: 120, height:120);

  Widget _inputForm(LoginViewModel loginVM, LoginStatus loginState) {
    return Container(
            margin:  EdgeInsets.symmetric(horizontal: p16, vertical: p16),
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
          );
  }

  Widget _loginButton(
    LoginViewModel vm,
    LoginStatus state, // 타입 변경
  ) {
    return DefaultButton(
      onPressed: () {
                Logger().d("[LoginView] login: ${userIdController.text}, ${passwordController.text}");
                // context.go('/calendar');
                vm.login(userIdController.text, passwordController.text);
      },
      text: '로그인',
    );
  }

 }
