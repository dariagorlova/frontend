import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failure.dart';
import 'package:shared_models/shared_models.dart';

abstract class Repository {
  /// local storage functions
  String getDeviceIdFromCache();
  Future<void> setDeviceIdToCache(String deviceId);
  User getUserCache();
  Future<void> setUserCache(User user);

  /// remote storage functions
  Future<Either<Failure, bool>> isAuthenticated();
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> createUser(String email, String password, String userName);
  Future<Either<Failure, void>> deleteAccount();


}