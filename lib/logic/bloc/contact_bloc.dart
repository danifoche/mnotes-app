import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mnotes/data/models/contact.dart';
import 'package:mnotes/data/repositories/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  final ContactRepository _contactRepository = ContactRepository();

  ContactBloc() : super(ContactInitial()) {

    // retrieve the contacts list
    on<ContactGetList>((event, emit) async {
      
      emit(ContactLoading());

      List<Contact> list = await _contactRepository.listContacts({}) ?? [];
      
      if(list.isNotEmpty) {
        emit(ContactList(list: list));
      } else {
        emit(ContactListEmpty());
      }

    });

  }
}
