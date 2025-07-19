// ViewModel
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/manager_home_viewmodel.dart';

final managerViewModelProvider =
    StateNotifierProvider<ManagerViewModel, ManagerHomeState>(
      (ref) => ManagerViewModel(),
    );
