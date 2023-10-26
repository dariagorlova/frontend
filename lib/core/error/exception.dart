class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class StatusCodeException implements Exception {
  final int statusCode;
  const StatusCodeException(this.statusCode);
}

class CacheException implements Exception {}
