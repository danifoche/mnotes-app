import 'package:mnotes/data/providers/authentication_provider.dart';

class AuthenticationRepository {

  // retrieve the authentication provider
  final AuthenticationProvider _authenticationProvider = AuthenticationProvider();

  // call the login provider function
  Future<Map<String, dynamic>?> logIn(Map<String, dynamic> credentials) async => await _authenticationProvider.logIn(credentials);

}