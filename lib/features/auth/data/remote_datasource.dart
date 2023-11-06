import 'package:frontend/core/error/exception.dart';
import 'package:frontend/core/http_manager.dart';

abstract class RemoteDataSourceAuth {
  const RemoteDataSourceAuth();
  Future<bool> isAuthenticated(String? token);
}

class RemoteDataSourceAuthImpl extends RemoteDataSourceAuth {
  final HTTPManager httpManager;
  const RemoteDataSourceAuthImpl(this.httpManager) : super();

  @override
  Future<bool> isAuthenticated(String? token) async {
    try {
      final res = await httpManager.get(url: 'auth/auth', token: token);
      return res['message'] == 'success';
    } on ServerException catch (_) {
      rethrow;
    } on StatusCodeException catch (_) {
      rethrow;
    } catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }
}
