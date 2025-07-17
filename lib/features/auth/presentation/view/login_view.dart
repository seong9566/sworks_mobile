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
  final passwordController = TextEditingController(text: "stecdev1234!");
  @override
  void dispose() {
    userIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final loginState = ref.watch(loginViewModelProvider);
    final siteVM = ref.read(siteSelectionViewModelProvider.notifier);

    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      // 시스템 관리자
      if (next.loginStatus == LoginStatusEnum.systemManager) {
        Logger().d("시스템 관리자");
        context.goNamed('system-manager');
        return;
      }
      // 매니저
      if (next.loginStatus == LoginStatusEnum.manager) {
        Logger().d("매니저");
        context.goNamed('site-selection');
      }

      // 마스터
      if (next.loginStatus == LoginStatusEnum.master) {
        Logger().d("마스터");
        context.goNamed('site-selection');
      }

      /// 관리자 (소장)
      if (next.loginStatus == LoginStatusEnum.siteManager) {
        Logger().d("관리자 (소장)");
        context.goNamed('site-selection');
      }

      /// 유저(담당자, 미화 여사님들)
      if (next.loginStatus == LoginStatusEnum.user) {
        Logger().d("유저(담당자, 미화 여사님들)");
        siteVM.addsiteLocation(LoginStatusEnum.user);
        return;
      }

      /// 유저(담당자, 미화 여사님들)
      if (next.loginStatus == LoginStatusEnum.guest) {
        Logger().d("유저(담당자, 미화 여사님들)");
        siteVM.addsiteLocation(LoginStatusEnum.guest);
        return;
      }

      if (next.loginStatus == LoginStatusEnum.changePwd) {
        Logger().d("비밀번호 변경 필요");
        context.pushNamed('password-change');
      }

      if (next.loginStatus == LoginStatusEnum.error) {
        Logger().d("로그인 에러");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage ?? "")));
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Spacer(flex: 1),
              logo(),
              const SizedBox(height: 16),
              _inputForm(loginVM, loginState),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Image logo() =>
      Image.asset("assets/img/sworks_logo.png", width: 120, height: 120);

  Widget _inputForm(LoginViewModel loginVM, LoginState loginState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthInputField(hintText: '아이디', controller: userIdController),
        const SizedBox(height: 16),
        AuthInputField(
          hintText: '비밀번호',
          controller: passwordController,
          isPassword: true,
          isPasswordVisible: loginState.isPasswordVisible,
          onSuffixIconPressed: () => loginVM.togglePasswordVisibility(),
        ),
        const SizedBox(height: 16),
        _loginButton(loginVM, loginState),
      ],
    );
  }

  Widget _loginButton(
    LoginViewModel vm,
    LoginState state, // 타입 변경
  ) {
    return DefaultButton(
      onPressed: () {
        vm.login(userIdController.text, passwordController.text);
      },
      text: '로그인',
    );
  }
}
