import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordChangeView extends ConsumerWidget {
  const PasswordChangeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('비밀번호 변경')),
      body: const Center(child: Text('비밀번호 변경 화면')),
    );
  }
}
