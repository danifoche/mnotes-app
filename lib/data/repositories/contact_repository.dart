import 'package:mnotes/data/models/contact.dart';
import 'package:mnotes/data/providers/contact_provider.dart';

class ContactRepository {

  // retrieve the providers
  final ContactProvider _contactProvider = ContactProvider();

  // call the providers functions
  Future<List<Contact>?> listContacts(Map<String, dynamic> arguments) async => await _contactProvider.list(arguments);

}