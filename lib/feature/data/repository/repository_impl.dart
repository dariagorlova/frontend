import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/exception.dart';
import 'package:frontend/core/error/failure.dart';
import 'package:frontend/core/network_info.dart';
import 'package:frontend/feature/data/datasources/local_datasource.dart';
import 'package:frontend/feature/data/datasources/remote_datasource.dart';
import 'package:frontend/feature/domain/repository/repository.dart';
import 'package:shared_models/shared_models.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> createUser(String email, String password, String userName) async {
    if (await networkInfo.isConnected) {
      try {
        final deviceId = getDeviceIdFromCache();
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
        final user = getUserCache();
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
        final deviceId = getDeviceIdFromCache();
        final user = await remoteDataSource.login(email, password, deviceId);
        await setUserCache(user);
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
        final user = getUserCache();
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
  Future<Either<Failure, bool>> isAuthenticated() async {
    if (await networkInfo.isConnected) {
      try {
        final user = getUserCache();
        final res = await remoteDataSource.isAuthenticated(user.token);
        return Right(res);
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
  Future<void> setDeviceIdToCache(String deviceId) => localDataSource.setDeviceIdToCache(deviceId);

  @override
  String getDeviceIdFromCache() => localDataSource.getDeviceIdFromCache();

  @override
  Future<void> setUserCache(User user) => localDataSource.setUserCache(user);

  @override
  User getUserCache() => localDataSource.getUserCache();

  @override
  Future<Either<Failure, void>> updateUser(String userName) async {
    if (await networkInfo.isConnected) {
      try {
        final user = getUserCache();
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
