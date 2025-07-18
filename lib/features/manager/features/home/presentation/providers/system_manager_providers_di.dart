import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/features/calendar/presentation/providers/calendar_providers_di.dart';
import 'package:sworks_mobile/features/manager/features/home/data/datasources/manager_site_remote_data_source.dart';
import 'package:sworks_mobile/features/manager/features/home/data/datasources/manager_site_remote_data_source_impl.dart';
import 'package:sworks_mobile/features/manager/features/home/data/repositories/manager_site_repository_impl.dart';
import 'package:sworks_mobile/features/manager/features/home/domain/repositories/manager_site_repository.dart';
import 'package:sworks_mobile/features/manager/features/home/domain/usecase/manager_get_site_list_usecase.dart';
import 'package:sworks_mobile/features/manager/features/home/presentation/viewmodels/system_manager_home_viewmodel.dart';

// ViewModel
final systemManagerViewModelProvider =
    StateNotifierProvider<SystemManagerViewModel, SystemManagerHomeState>(
      (ref) =>
          SystemManagerViewModel(ref.read(managerGetSiteListUsecaseProvider)),
    );

final managerGetSiteListUsecaseProvider = Provider<ManagerGetSiteListUsecase>((
  ref,
) {
  return ManagerGetSiteListUsecase(ref.read(managerSiteRepositoryProvider));
});

final managerSiteRepositoryProvider = Provider<ManagerSiteRepository>((ref) {
  return ManagerSiteRepositoryImpl(
    ref.read(managerSiteRemoteDataSourceProvider),
  );
});

final managerSiteRemoteDataSourceProvider =
    Provider<ManagerSiteRemoteDataSource>((ref) {
      return ManagerSiteRemoteDataSourceImpl(ref.read(dioClientProvider));
    });
