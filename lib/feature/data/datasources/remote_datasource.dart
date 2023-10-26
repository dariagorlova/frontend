import 'package:frontend/core/error/exception.dart';
import 'package:frontend/core/http_manager.dart';
import 'package:shared_models/shared_models.dart';

abstract class RemoteDataSource {
  const RemoteDataSource();
  Future<bool> isAuthenticated(String? token);
  Future<User> login(String email, String password, String deviceId);
  Future<void> logout(String? token);
  Future<void> createUser(String email, String password, String userName, String deviceId);
  Future<void> deleteAccount(String? token);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final HTTPManager httpManager;
  const RemoteDataSourceImpl(this.httpManager) : super();

  @override
  Future<void> createUser(String email, String password, String userName, String deviceId) async {
    try {
      await httpManager.post(
          url: 'auth/signup',
          params: {
            "user_name": userName,
            "email": email,
            "password": password,
            "device_id": deviceId,
            "referal_code": ""
          },
          token: '');
    } on ServerException catch (_) {
      rethrow;
    } on StatusCodeException catch (_) {
      rethrow;
    } catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }

  @override
  Future<void> deleteAccount(String? token) async {
    try {
      await httpManager.post(
        url: 'auth/delete',
        token: token,
      );
    } on ServerException catch (_) {
      rethrow;
    } on StatusCodeException catch (_) {
      rethrow;
    } catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }

  @override
  Future<bool> isAuthenticated(String? token) async {
    return false;
  }

  @override
  Future<User> login(String email, String password, String deviceId) async {
    try {
      final res = await httpManager.get(
          url: 'auth/login',
          params: {
            "email": email,
            "password": password,
            "device_id": deviceId,
          },
          token: '');
      return User.fromJson(res['data']);
    } on ServerException catch (_) {
      rethrow;
    } on StatusCodeException catch (_) {
      rethrow;
    } catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }

  @override
  Future<void> logout(String? token) async {
    try {
      await httpManager.get(
        url: 'auth/logout',
        token: token,
      );
    } on ServerException catch (_) {
      rethrow;
    } on StatusCodeException catch (_) {
      rethrow;
    } catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }
}
