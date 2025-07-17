import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/features/system_manager/features/home/presentation/viewmodels/system_manager_home_viewmodel.dart';

final systemManagerViewModelProvider =
    StateNotifierProvider<SystemManagerViewModel, SystemManagerState>(
      (ref) => SystemManagerViewModel(),
    );
