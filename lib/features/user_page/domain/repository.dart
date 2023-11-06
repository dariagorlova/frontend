import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failure.dart';
import 'package:shared_models/shared_models.dart';

abstract class RepositoryUser {
  Future<Either<Failure, User>> login(String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> createUser(String email, String password, String userName);
  Future<Either<Failure, void>> updateUser(String userName);
  Future<Either<Failure, void>> deleteAccount();
}
