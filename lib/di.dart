import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/data/data.dart';
import 'package:test_mobile/domain/domain.dart';
import 'package:test_mobile/feature/auth/viewmodel/auth_viewmodel.dart';
import 'package:test_mobile/feature/business/viewmodel/business_viewmodel.dart';
import 'package:test_mobile/feature/dashboard/viewmodel/dashboard_viewmodel.dart';

final locator = GetIt.I;
Future<void> setup() async {
  locator
    //viewmodel --> providers
    ..registerLazySingleton<DashboardViewmodel>(
      () => DashboardViewmodel(locator()),
    )
    ..registerLazySingleton<BusinessViewmodel>(
      () => BusinessViewmodel(locator()),
    )
    ..registerLazySingleton<AuthViewmodel>(
      () => AuthViewmodel(locator()),
    )
    //domain --> repositories
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(locator()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()),
    )
    //data --> apis
    ..registerLazySingleton<ProductApi>(
      () => DummyProduct(locator()),
    )
    ..registerLazySingleton<AuthApi>(
      () => DummyAuth(locator()),
    )
    //services
    ..registerLazySingleton<HttpService>(
      () => DioService(locator()),
    )
    ..registerLazySingleton<Dio>(
      () => Dio(),
    );
}
