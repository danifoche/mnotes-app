import 'dart:convert';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/rest.dart';

class AuthenticationApi {

  final Rest _rest = Rest();

  // perform a login request with the given user credentials
  dynamic logIn(Map<String, dynamic> credentials) async {

    Map<String, dynamic> response = await _rest.post(jsonEncode(credentials), apiEndpoints["auth"]?["login"] ?? "", null);

    print(response);

  }

}