import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mnotes/data/models/user.dart';

class UserProvider {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final User _user = User();

  // retrieve the user details stored in the storage
  Future<User?> details() async {

    // read the storage
    String? userDetails = await _storage.read(key: "userStorageKey");

    // return null in case the user is not found
    if(userDetails == null) {
      return null;
    }

    // return the user model
    return User.fromJson(jsonDecode(userDetails));
  }

}