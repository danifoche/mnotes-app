part of 'contact_bloc.dart';

sealed class ContactState extends Equatable {
  const ContactState();
  
  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {}

final class ContactLoading extends ContactState {}

final class ContactList extends ContactState {

  final List<Contact> list;

  const ContactList({required this.list});
}

final class ContactListEmpty extends ContactState {}