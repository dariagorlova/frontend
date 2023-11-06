import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failure.dart';

abstract class RepositoryAuth {
  Future<Either<Failure, bool>> isAuthenticated();
}
