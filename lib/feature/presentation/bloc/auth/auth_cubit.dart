import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/feature/domain/repository/repository.dart';
import 'package:shared_models/shared_models.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

/// authentication state management class
class AuthCubit extends Cubit<AuthState> {
  final Repository repository;

  /// initial
  AuthCubit({required this.repository}) : super(const AuthState.initial());

  /// check if we can get access to application
  /// or have to start from login page
  Future<bool> isAuthenticated() async {
    emit(const AuthState.loading());
    final failureOrData = await repository.isAuthenticated();
    failureOrData.fold((error) {
      emit(const AuthState.restricted());
    }, (res) async {
      if (res) {
        // get user model from local storage
        final user = repository.getUserCache();
        emit(AuthState.authenticated(user: user));
      } else {
        // clear local storage
        await repository.setUserCache(User.empty());
        emit(const AuthState.restricted());
      }
      return res;
    });
    return false;
  }

  Future<void> setAuthentication(bool isAuth) async {
    emit(const AuthState.loading());
    if (isAuth) {
      final user = repository.getUserCache();
      emit(AuthState.authenticated(user: user));
    } else {
      // clear local storage
      await repository.setUserCache(User.empty());
      emit(const AuthState.restricted());
    }
  }
}
