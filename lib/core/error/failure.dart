import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@Freezed()
abstract class Failure with _$Failure {
  const factory Failure.serverFailure({required String message}) = _ServerFailure;
  const factory Failure.cacheFailure() = _CacheFailure;
  const factory Failure.statusCode({required int statusCode}) = _StatusCode;
}