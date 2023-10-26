part of 'auth_cubit.dart';

@Freezed()
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error({required String message}) = _Error;
  const factory AuthState.success({required User user}) = _Success;
  const factory AuthState.showEmailNeedVerifyScreen() = _showEmailNeedVerifyScreen;
  const factory AuthState.showResentEmailPopup() = _showResentEmailPopup;
  const factory AuthState.moveToLoginPage() = _moveToLoginPage;
}
