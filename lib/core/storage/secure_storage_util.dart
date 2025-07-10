import 'dart:convert';

import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/features/site/data/models/user_permission_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class SecureStorageUtil {
  // 키 상수
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _fcmTokenKey = 'fcm_token';
  static const _uuidKey = 'uuid';
  static const _ruleKey = 'rule';
  static const _userPermissionKey = 'user_permission';
  static const _loginInfoKey = 'login_info';

  static const _storage = FlutterSecureStorage();

  /// 로그인 정보를 SecureStorage에 저장
  static Future<void> saveLoginInfo(LoginResponseModel loginInfo) async {
    // Map<String, dynamic>을 JSON 문자열로 변환하여 저장
    final String jsonString = jsonEncode(loginInfo.toJson());
    await _storage.write(key: _loginInfoKey, value: jsonString);
  }

  /// 저장된 로그인 정보를 SecureStorage에서 조회
  static Future<LoginResponseModel?> getLoginInfo() async {
    final String? jsonString = await _storage.read(key: _loginInfoKey);
    if (jsonString == null) {
      return null;
    }
    try {
      // JSON 문자열을 Map<String, dynamic>으로 변환 후 모델 객체로 변환
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;
      return LoginResponseModel.fromJson(jsonMap);
    } catch (e) {
      debugPrint('로그인 정보 파싱 오류: $e');
      return null;
    }
  }

  /// 사용자 권한 정보를 SecureStorage에 저장
  static Future<void> saveUserPermission(
    UserPermissionResponseModel userPermission,
  ) async {
    // Map<String, dynamic>을 JSON 문자열로 변환하여 저장
    final String jsonString = jsonEncode(userPermission.toJson());
    await _storage.write(key: _userPermissionKey, value: jsonString);
  }

  /// 저장된 사용자 권한 정보를 SecureStorage에서 조회
  static Future<UserPermissionResponseModel?> getUserPermission() async {
    final String? jsonString = await _storage.read(key: _userPermissionKey);
    if (jsonString == null) {
      return null;
    }
    try {
      // JSON 문자열을 Map<String, dynamic>으로 변환 후 모델 객체로 변환
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;
      return UserPermissionResponseModel.fromJson(jsonMap);
    } catch (e) {
      Logger().d('사용자 권한 정보 파싱 오류: $e');
      return null;
    }
  }

  // Access Token CRUD
  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  static Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  static Future<void> updateAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  // Refresh Token CRUD
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  static Future<void> updateRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  // FCM Token CRUD
  static Future<void> saveFcmToken(String fcmToken) async {
    await _storage.write(key: _fcmTokenKey, value: fcmToken);
  }

  static Future<String?> getFcmToken() async {
    return await _storage.read(key: _fcmTokenKey);
  }

  static Future<void> deleteFcmToken() async {
    await _storage.delete(key: _fcmTokenKey);
  }

  static Future<void> updateFcmToken(String fcmToken) async {
    await _storage.write(key: _fcmTokenKey, value: fcmToken);
  }

  // Rule CRUD
  static Future<void> saveRule(String rule) async {
    await _storage.write(key: _ruleKey, value: rule);
  }

  static Future<String?> getRule() async {
    return await _storage.read(key: _ruleKey);
  }

  static Future<void> deleteRule() async {
    await _storage.delete(key: _ruleKey);
  }

  static Future<void> updateRule(String rule) async {
    await _storage.write(key: _ruleKey, value: rule);
  }

  // UUID CRUD
  static Future<void> saveUuid(String uuid) async {
    await _storage.write(key: _uuidKey, value: uuid);
  }

  static Future<String?> getUuid() async {
    return await _storage.read(key: _uuidKey);
  }

  static Future<void> deleteUuid() async {
    await _storage.delete(key: _uuidKey);
  }

  static Future<void> updateUuid(String uuid) async {
    await _storage.write(key: _uuidKey, value: uuid);
  }

  // 전체 데이터 관리
  static Future<void> saveAll({
    required String accessToken,
    required String refreshToken,
    required String deviceOS,
    required String fcmToken,
    required String uuid,
    required String rule,
  }) async {
    await Future.wait([
      saveAccessToken(accessToken),
      saveRefreshToken(refreshToken),
      saveFcmToken(fcmToken),
      saveUuid(uuid),
      saveRule(rule),
    ]);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // 특정 키 존재 여부 확인
  static Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  // 모든 키 조회
  static Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
