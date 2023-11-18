import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mnotes/data/providers/user_provider.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/rest.dart';

class AuthenticationProvider {

  final Rest _rest = Rest();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final UserProvider _userProvider = UserProvider();

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

  //? check if the token is store, the validation will be done when we make an actual api call
  //? and if the token will not be valid anymore we will get a new one with the refreshtoken
  Future<bool> checkAccessToken() async {

    // get the user token or empty if it's null
    String accessToken = ((await _userProvider.details())?.accessToken) ?? "";

    // check if the access token exists
    if(accessToken.isEmpty) {
      return false;
    }

    return true;
  }

}