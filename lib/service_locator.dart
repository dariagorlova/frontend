import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/features/auth/data/remote_datasource.dart';
import 'package:frontend/features/auth/data/repository_impl.dart';
import 'package:frontend/features/auth/domain/repository/repository.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:frontend/features/user_page/data/remote_datasource.dart';
import 'package:frontend/features/user_page/data/repository_impl.dart';
import 'package:frontend/features/user_page/domain/repository.dart';
import 'package:frontend/features/user_page/presentation/bloc/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:frontend/core/http_manager.dart';
import 'package:frontend/core/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initDI() async {
  //BLoC
  instance.registerLazySingleton(() => AuthCubit(repository: instance()));
  instance.registerLazySingleton(() => UserCubit(repository: instance()));

  //Repository
  instance.registerLazySingleton<RepositoryAuth>(
    () => RepositoryAuthImpl(
      remoteDataSource: instance(),
      networkInfo: instance(),
      localDataSource: instance(),
    ),
  );

  instance.registerLazySingleton<RepositoryUser>(
    () => RepositoryUserImpl(
      remoteDataSource: instance(),
      networkInfo: instance(),
      localDataSource: instance(),
    ),
  );

  //Data
  instance.registerLazySingleton<RemoteDataSourceAuth>(() => RemoteDataSourceAuthImpl(instance()));
  instance.registerLazySingleton<RemoteDataSourceUser>(() => RemoteDataSourceUserImpl(instance()));

  //Core
  instance.registerLazySingleton<LocalStorageService>(
      () => LocalStorageServiceImpl(storage: instance()));
  instance.registerLazySingleton(() => HTTPManager.instance);
  instance.registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);

  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //instance.registerSingleton<GymismoToast>(GymismoToast(FToast(), Utils.scaffoldKey.currentContext!));

  await instance.allReady();
}
