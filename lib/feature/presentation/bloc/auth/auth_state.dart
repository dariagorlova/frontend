part of 'auth_cubit.dart';

@Freezed()
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.restricted() = _Restricted;
  const factory AuthState.authenticated({required User user}) = _Authenticated;
}
