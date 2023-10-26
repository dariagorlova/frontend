import 'dart:convert';

import 'package:shared_models/shared_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userCacheField = 'user_cache';
const deviceIdCacheField = 'device_id_cache';

abstract class LocalDataSource {
  String getDeviceIdFromCache();
  Future<void> setDeviceIdToCache(String deviceId);
  User getUserCache();
  Future<void> setUserCache(User user);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences storage;
  LocalDataSourceImpl({required this.storage});

  @override
  String getDeviceIdFromCache() => storage.getString(deviceIdCacheField) ?? '';

  @override
  User getUserCache() {
    final userAsString = storage.getString(userCacheField);
    if (userAsString != null) {
      return User.fromJson(json.decode(userAsString));
    }
    return User.empty();
  }

  @override
  Future<void> setDeviceIdToCache(String deviceId) =>
    storage.setString(deviceIdCacheField, deviceId);

  @override
  Future<void> setUserCache(User user) async {
    final userAsString = json.encode(user.toJson());
    await storage.setString(userCacheField, userAsString);
  }
}
