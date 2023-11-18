import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mnotes/data/models/contact.dart';
import 'package:mnotes/data/providers/user_provider.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/rest.dart';

class ContactProvider {

  final Rest _rest = Rest();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final UserProvider _userProvider = UserProvider();

  // retrieve a list of contacts
  Future<List<Contact>?> list(Map<String, dynamic> arguments) async {

    // get the user token or empty if it's null
    String accessToken = ((await _userProvider.details())?.accessToken) ?? "";

    // check if token exists
    if(accessToken.isEmpty) {
      return null;
    }

    // TODO: handle refersh token and token errors
    // TODO: understand why the get request fails
    // get the list
    Map<String, dynamic> response = await _rest.get(jsonEncode(arguments), apiEndpoints["contacts"]?["list"] ?? "", accessToken);

    return (response["success"])
      ? (response["data"]["items"] as List<dynamic>)
          .map((contact) => Contact.fromJson(contact))
          .toList()
      : [];
  }

}