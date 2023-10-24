import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/rest.dart';

class AuthenticationProvider {

  final Rest _rest = Rest();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // perform a login request with the given user credentials
  Future<Map<String, dynamic>?> logIn(Map<String, dynamic> credentials) async {

    Map<String, dynamic> response = await _rest.post(jsonEncode(credentials), apiEndpoints["auth"]?["login"] ?? "", null);

    // store the user info on device storage and prepare the values to be converted into user model
    _storage.write(key: "userStorageKey", value: jsonEncode({
      ...response["data"],
      "accessToken": response["access_token"],
      "refreshToken": response["refresh_token"]
    }));

    return response;
  }

}