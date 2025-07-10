import 'package:sworks_mobile/features/site/data/datasources/site_remote_data_source.dart';
import 'package:sworks_mobile/features/site/data/datasources/site_remote_data_source_impl.dart';
import 'package:sworks_mobile/features/site/data/repositories/site_repository_impl.dart';
import 'package:sworks_mobile/features/site/domain/repositories/site_repository.dart';
import 'package:sworks_mobile/features/site/domain/usecases/add_site_usecase.dart';
import 'package:sworks_mobile/features/site/domain/usecases/get_site_usecase.dart';
import 'package:sworks_mobile/features/site/presentation/viewmodels/site_selection_viewmodel.dart';
import 'package:sworks_mobile/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 데이터소스 Provider
final siteRemoteDataSourceProvider = Provider<siteRemoteDataSource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return siteRemoteDataSourceImpl(dioClient);
});

// 리포지토리 Provider
final siteRepositoryProvider = Provider<SiteRepository>((ref) {
  final remoteDataSource = ref.watch(siteRemoteDataSourceProvider);
  return SiteRepositoryImpl(remoteDataSource);
});

// 유스케이스 Provider
final getsiteLocationsUseCaseProvider = Provider<GetSiteUseCase>((ref) {
  final repository = ref.watch(siteRepositoryProvider);
  return GetSiteUseCase(repository);
});

final addsiteLocationUseCaseProvider = Provider<AddSiteUseCase>((ref) {
  final repository = ref.watch(siteRepositoryProvider);
  return AddSiteUseCase(repository);
});

// 뷰모델 Provider
final siteSelectionViewModelProvider =
    StateNotifierProvider<SiteSelectionViewModel, SiteSelectionState>((ref) {
      final useCase = ref.watch(getsiteLocationsUseCaseProvider);
      final addUseCase = ref.watch(addsiteLocationUseCaseProvider);
      return SiteSelectionViewModel(useCase, addUseCase);
    });
