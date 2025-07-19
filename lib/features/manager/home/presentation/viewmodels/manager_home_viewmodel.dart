import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManagerHomeState {
  final int tabIndex;

  ManagerHomeState({this.tabIndex = 0});

  ManagerHomeState copyWith({int? tabIndex}) {
    return ManagerHomeState(tabIndex: tabIndex ?? this.tabIndex);
  }
}

class ManagerViewModel extends StateNotifier<ManagerHomeState> {
  ManagerViewModel() : super(ManagerHomeState());

  void changeTab(int tabIndex) {
    state = state.copyWith(tabIndex: tabIndex);
  }
}
