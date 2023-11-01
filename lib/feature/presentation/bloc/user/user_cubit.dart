import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/feature/domain/repository/repository.dart';
import 'package:frontend/feature/presentation/bloc/auth/auth_cubit.dart';
import 'package:frontend/service_locator.dart' as di;
import 'package:shared_models/shared_models.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final Repository repository;

  /// initial
  UserCubit({required this.repository}) : super(const UserState.initial());

  /// private function for checking user input while login process
  bool _checkInput({String? name, String? email, String? password, String? newPassword}) {
    emit(const UserState.loading());

    if (email != null) {
      final emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );
      if (email.isEmpty) {
        emit(const UserState.error(message: 'email can\'t be empty'));

        return false;
      }

      if (!emailRegExp.hasMatch(email) || email.length > 30) {
        emit(const UserState.error(message: 'invalid email syntax'));
        return false;
      }
    }

    if (password != null) {
      if (password.isEmpty) {
        emit(const UserState.error(message: 'password can\'t be empty'));
        return false;
      }

      final passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');
      if (!passwordRegExp.hasMatch(password) || password.length > 12) {
        emit(const UserState.error(message: 'password length is 8-12 symbols'));
        return false;
      }
    }

    if (newPassword != null) {
      if (newPassword.isEmpty) {
        emit(const UserState.error(message: 'new password can\'t be empty'));
        return false;
      }

      final passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');
      if (!passwordRegExp.hasMatch(newPassword) || newPassword.length > 12) {
        emit(const UserState.error(message: 'new password length is 8-12 symbols'));
        return false;
      }
    }

    if (name != null) {
      if (name.isEmpty) {
        emit(const UserState.error(message: 'user name can\'t be empty'));
        return false;
      }

      if (name.length > 20) {
        emit(const UserState.error(message: 'max user name length - 20 symbols'));
        return false;
      }
    }
    return true;
  }

  /// login event process
  Future<void> logIn(String email, String password) async {
    if (_checkInput(email: email, password: password)) {
      final failureOrData = await repository.login(email, password);
      failureOrData.fold((error) {
        error.when(
            serverFailure: (message) => emit(UserState.error(message: message)),
            cacheFailure: () {},
            statusCode: (statusCode) {
              if (statusCode == 226) {
                emit(const UserState.resendEmailAlert());
              }
              if (statusCode == 426) {
                di.instance<AuthCubit>().setAuthentication(false);
              }
            });
      }, (data) async {
        emit(UserState.success(user: data));
        di.instance<AuthCubit>().setAuthentication(true);
      });
    }
  }

  /// logout event process
  Future<void> logOut() async {
    final failureOrData = await repository.logout();
    failureOrData.fold((error) {
      error.when(
          serverFailure: (message) => emit(UserState.error(message: message)),
          cacheFailure: () {},
          statusCode: (_) {});
    }, (data) async {
      // clear user cache data
      await repository.setUserCache(User.empty());
      di.instance<AuthCubit>().setAuthentication(false);
    });
  }

  /// delete account process
  Future<void> deleteAccount() async {
    final failureOrData = await repository.deleteAccount();
    failureOrData.fold((error) {
      error.when(
          serverFailure: (message) => emit(UserState.error(message: message)),
          cacheFailure: () {},
          statusCode: (_) {});
    }, (data) async {
      await repository.setUserCache(User.empty());
      di.instance<AuthCubit>().setAuthentication(false);
    });
  }

  /// yeah, you're right, signup process
  Future<bool> signUp(String email, String password, String userName) async {
    var result = false;
    if (_checkInput(email: email, password: password, name: userName)) {
      final failureOrData = await repository.createUser(email, password, userName);
      failureOrData.fold((error) {
        error.when(
            serverFailure: (message) => emit(UserState.error(message: message)),
            cacheFailure: () {},
            statusCode: (_) {});
      }, (data) {
        result = true;
      });
    }
    return result;
  }

  Future<void> resendVerificationEmail(String email) async {
    if (_checkInput(email: email)) {
      //
    }
  }

  Future<bool> changeName(
    String name,
  ) async {
    var result = false;
    if (_checkInput(name: name)) {
      final failureOrData = await repository.updateUser(name);
      failureOrData.fold((error) {
        error.when(
            serverFailure: (message) => emit(UserState.error(message: message)),
            cacheFailure: () {},
            statusCode: (_) {});
      }, (data) {
        result = true;
      });
    }
    return result;
  }

  Future<void> changePhoto(String photoUrl) async {
    //
  }

  Future<void> changeCredentials() async {
    //
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    if (_checkInput(password: oldPassword, newPassword: newPassword)) {
      //
    }
  }

  Future<void> forgotPassword(String email) async {
    if (_checkInput(email: email)) {
      //
    }
  }
}
