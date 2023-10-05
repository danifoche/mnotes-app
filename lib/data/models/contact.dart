import 'package:equatable/equatable.dart';
import 'package:mnotes/data/models/note.dart';

class Contact extends Equatable {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? company;
  String? image;
  List<Note>? notes;
  String? createdAt;
  String? updatedAt;

  Contact(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.company,
      this.image,
      this.notes,
      this.createdAt,
      this.updatedAt});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    company = json['company'];
    image = json['image'];
    if (json['notes'] != null) {
      notes = <Note>[];
      json['notes'].forEach((v) {
        notes!.add(Note.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['company'] = company;
    data['image'] = image;
    if (notes != null) {
      data['notes'] = notes!.map((item) => item.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, phone, company, image, notes, createdAt, updatedAt];
}