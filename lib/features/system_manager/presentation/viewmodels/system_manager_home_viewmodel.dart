import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class SystemManagerState {
  final int tabIndex;
  SystemManagerState({required this.tabIndex});

  SystemManagerState copyWith({int? tabIndex}) {
    return SystemManagerState(tabIndex: tabIndex ?? this.tabIndex);
  }
}

class SystemManagerViewModel extends StateNotifier<SystemManagerState> {
  SystemManagerViewModel() : super(SystemManagerState(tabIndex: 0));

  void changeTab(int tabIndex) {
    Logger().d("tabIndex: $tabIndex");
    state = state.copyWith(tabIndex: tabIndex);
  }
}
