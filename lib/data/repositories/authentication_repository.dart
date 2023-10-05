import 'package:mnotes/data/providers/authentication_api.dart';

class AuthenticationRepository {

  // retrieve the authentication provider
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  // call the login provider function
  dynamic logIn(Map<String, dynamic> credentials) async => await _authenticationApi.logIn(credentials);

}