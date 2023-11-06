import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/exception.dart';
import 'package:frontend/core/error/failure.dart';
import 'package:frontend/core/network_info.dart';
import 'package:frontend/core/services/local_storage_service.dart';
import 'package:frontend/features/auth/data/remote_datasource.dart';

import 'package:frontend/features/auth/domain/repository/repository.dart';

class RepositoryAuthImpl implements RepositoryAuth {
  final RemoteDataSourceAuth remoteDataSource;
  final LocalStorageService localDataSource;
  final NetworkInfo networkInfo;

  RepositoryAuthImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    if (await networkInfo.isConnected) {
      try {
        final user = localDataSource.getUserCache();
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
}
