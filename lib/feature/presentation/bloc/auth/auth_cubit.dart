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

  /// private function for checking user input while login process
  bool _checkInput({String? name, String? email, String? password}) {
    emit(const AuthState.loading());

    if (email != null) {
      final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );
      if (email.isEmpty) {
        emit(const AuthState.error(message: 'email can\'t be empty'));

        return false;
      }

      if (!emailRegExp.hasMatch(email) || email.length > 30) {
        emit(const AuthState.error(message: 'invalid email syntax'));
        return false;
      }
    }

    if (password != null) {
      if (password.isEmpty) {
        emit(const AuthState.error(message: 'password can\'t be empty'));
        return false;
      }

      final passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');
      if (!passwordRegExp.hasMatch(password) || password.length > 12) {
        emit(const AuthState.error(message: 'max password length - 12 symbols'));
        return false;
      }
    }

    if (name != null) {
      if (name.isEmpty) {
        emit(const AuthState.error(message: 'user name can\'t be empty'));
        return false;
      }

      if (name.length > 20) {
        emit(const AuthState.error(message: 'max user name length - 20 symbols'));
        return false;
      }
    }
    return true;
  }

  /// initial check from local storage credentials, if we can see a main page
  /// orr have to start from login page
  Future<bool> isAuthenticated() async {
    final failureOrData = await repository.isAuthenticated();
    failureOrData.fold((error) {
      error.when(
          serverFailure: (message) => emit(AuthState.error(message: message)),
          cacheFailure: () {},
          statusCode: (statusCode) {
            if (statusCode == 226) {
              emit(const AuthState.showResentEmailPopup());
            }
            if (statusCode == 426) {
              emit(const AuthState.moveToLoginPage());
            }
          });
    }, (res) async {
      if (res) {
        // get user model from local storage
        final user = repository.getUserCache();
        emit(AuthState.success(user: user));
      } else {
        // clear local storage
        await repository.setUserCache(User.empty());
        emit(const AuthState.error(message: ''));
      }
      return res;
    });
    return false;
  }

  /// login event process
  Future<void> logIn(String email, String password) async {
    if (_checkInput(email: email, password: password)) {
      final failureOrData = await repository.login(email, password);
      failureOrData.fold((error) {
        error.when(
            serverFailure: (message) => emit(AuthState.error(message: message)),
            cacheFailure: () {},
            statusCode: (statusCode) {
              if (statusCode == 226) {
                emit(const AuthState.showResentEmailPopup());
              }
              if (statusCode == 426) {
                emit(const AuthState.moveToLoginPage());
              }
            });
      }, (data) async {
        emit(AuthState.success(user: data));
      });
    }
  }

  /// logout event process
  Future<void> logOut() async {
    final failureOrData = await repository.logout();
    failureOrData.fold((error) {
      error.when(
          serverFailure: (message) => emit(AuthState.error(message: message)),
          cacheFailure: () {},
          statusCode: (_) {});
    }, (data) async {
      // clear user cache data
      await repository.setUserCache(User.empty());
      emit(const AuthState.error(message: ''));
    });
  }

  /// delete account process
  Future<void> deleteAccount() async {
    final failureOrData = await repository.deleteAccount();
    failureOrData.fold((error) {
      error.when(
          serverFailure: (message) => emit(AuthState.error(message: message)),
          cacheFailure: () {},
          statusCode: (_) {});
    }, (data) async {
      await repository.setUserCache(User.empty());
      emit(const AuthState.error(message: ''));
    });
  }

  /// yeah, you're right, signup process
  Future<void> signUp(String email, String password, String userName) async {
    if (_checkInput(email: email, password: password, name: userName)) {
      final failureOrData = await repository.createUser(email, password, userName);
      failureOrData.fold((error) {
        error.when(
            serverFailure: (message) => emit(AuthState.error(message: message)),
            cacheFailure: () {},
            statusCode: (_) {});
      }, (data) {
        emit(const AuthState.showEmailNeedVerifyScreen());
      });
    }
  }

  Future<void> verifyEmail(String email) async {
    //
  }
}
