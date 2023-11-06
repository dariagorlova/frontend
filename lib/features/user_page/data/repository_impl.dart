import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/exception.dart';
import 'package:frontend/core/error/failure.dart';
import 'package:frontend/core/network_info.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/features/user_page/data/remote_datasource.dart';
import 'package:frontend/features/user_page/domain/repository.dart';
import 'package:shared_models/shared_models.dart';

class RepositoryUserImpl implements RepositoryUser {
  final RemoteDataSourceUser remoteDataSource;
  final LocalStorageService localDataSource;
  final NetworkInfo networkInfo;

  RepositoryUserImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> createUser(String email, String password, String userName) async {
    if (await networkInfo.isConnected) {
      try {
        final deviceId = localDataSource.getDeviceIdFromCache();
        return Right(await remoteDataSource.createUser(email, password, userName, deviceId));
      } on ServerException catch (e) {
        return Left(Failure.serverFailure(message: e.message));
      } on StatusCodeException catch (e) {
        return Left(Failure.statusCode(statusCode: e.statusCode));
      }
    } else {
      return const Left(Failure.serverFailure(message: 'Check the Internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        final user = localDataSource.getUserCache();
        return Right(await remoteDataSource.deleteAccount(user.token));
      } on ServerException catch (e) {
        return Left(Failure.serverFailure(message: e.message));
      } on StatusCodeException catch (e) {
        return Left(Failure.statusCode(statusCode: e.statusCode));
      }
    } else {
      return const Left(Failure.serverFailure(message: 'Check the Internet connection'));
    }
  }

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final deviceId = localDataSource.getDeviceIdFromCache();
        final user = await remoteDataSource.login(email, password, deviceId);
        await localDataSource.setUserCache(user);
        return Right(user);
      } on ServerException catch (e) {
        return Left(Failure.serverFailure(message: e.message));
      } on StatusCodeException catch (e) {
        return Left(Failure.statusCode(statusCode: e.statusCode));
      }
    } else {
      return const Left(Failure.serverFailure(message: 'Check the Internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await networkInfo.isConnected) {
      try {
        final user = localDataSource.getUserCache();
        return Right(await remoteDataSource.logout(user.token));
      } on ServerException catch (e) {
        return Left(Failure.serverFailure(message: e.message));
      } on StatusCodeException catch (e) {
        return Left(Failure.statusCode(statusCode: e.statusCode));
      }
    } else {
      return const Left(Failure.serverFailure(message: 'Check the Internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(String userName) async {
    if (await networkInfo.isConnected) {
      try {
        final user = localDataSource.getUserCache();
        return Right(await remoteDataSource.updateUser(user.token, userName));
      } on ServerException catch (e) {
        return Left(Failure.serverFailure(message: e.message));
      } on StatusCodeException catch (e) {
        return Left(Failure.statusCode(statusCode: e.statusCode));
      }
    } else {
      return const Left(Failure.serverFailure(message: 'Check the Internet connection'));
    }
  }
}
