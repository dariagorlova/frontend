part of 'user_cubit.dart';

@Freezed()
abstract class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.loadingWithProgress() = _LoadingWithProgress;
  const factory UserState.error({required String message}) = _Error;
  const factory UserState.success({required User user}) = _Success;
  const factory UserState.resendEmailAlert() = _ResendEmailAlert;
}
