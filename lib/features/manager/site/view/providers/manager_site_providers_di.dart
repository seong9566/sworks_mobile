import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/features/calendar/presentation/providers/calendar_providers_di.dart';

import '../../data/datasources/manager_site_remote_data_source.dart';
import '../../data/datasources/manager_site_remote_data_source_impl.dart';
import '../../data/repositories/manager_site_repository_impl.dart';
import '../../domain/repositories/manager_site_repository.dart';
import '../../domain/usecase/manager_get_site_list_usecase.dart';
import '../viewmodels/manager_site_viewmodel.dart';

final managerSiteViewModelProvider =
    StateNotifierProvider<ManagerSiteViewModel, ManagerSiteViewState>(
      (ref) =>
          ManagerSiteViewModel(ref.read(managerGetSiteListUsecaseProvider)),
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
