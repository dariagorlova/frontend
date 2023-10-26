import 'dart:io';

/// base abstract class for checking internet connection
abstract class NetworkInfo {
  /// if "true" - we have internet connection
  Future<bool> get isConnected;
}

/// implementation of [NetworkInfo] class. Checking internet connection
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl();

  /// just looks if the "example.com" available
  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}