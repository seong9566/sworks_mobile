import 'package:sworks_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sworks_mobile/features/auth/data/datasources/auth_remote_data_source_impl.dart';
import 'package:sworks_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:sworks_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:sworks_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// DioClient Provider
final dioClientProvider = Provider<DioClient>((ref) => DioClient());

// AuthRemoteDataSource Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthRemoteDataSourceImpl(dioClient);
});

// AuthRepository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

// LoginUseCase Provider
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

// LoginViewModel Provider
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginStatus>((ref) {
      final loginUseCase = ref.watch(loginUseCaseProvider);
      return LoginViewModel(loginUseCase);
    });
