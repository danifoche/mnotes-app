import 'package:mnotes/data/providers/contact_provider.dart';

class HomeRepository {

  // retrieve the providers
  final ContactProvider _contactProvider = ContactProvider();

  // call the providers functions
  Future<Map<String, dynamic>?> listContacts(Map<String, dynamic> arguments) async => await _contactProvider.list(arguments);

}