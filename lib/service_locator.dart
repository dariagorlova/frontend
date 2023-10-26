import 'package:get_it/get_it.dart';
import 'package:frontend/core/http_manager.dart';
import 'package:frontend/core/network_info.dart';
import 'package:frontend/feature/data/datasources/local_datasource.dart';
import 'package:frontend/feature/data/datasources/remote_datasource.dart';
import 'package:frontend/feature/data/repository/repository_impl.dart';
import 'package:frontend/feature/domain/repository/repository.dart';
import 'package:frontend/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initDI() async {
  //BLoC
  instance.registerLazySingleton(() => AuthCubit(repository: instance()));

  //Repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: instance(),
      networkInfo: instance(),
      localDataSource: instance(),
    ),
  );

  //Data
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(storage: instance()));
  instance.registerLazySingleton(() => HTTPManager.instance);

  //Core
  instance.registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);

  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  await instance.allReady();
}
