import 'package:equatable/equatable.dart';

class User extends Equatable {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? language;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? refreshToken;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.avatar,
      this.language,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.accessToken,
      this.refreshToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    language = json['language'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['language'] = language;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }

  @override
  List<Object?> get props => [id, firstName, lastName, avatar, language, email, createdAt, updatedAt, accessToken, refreshToken];
}
