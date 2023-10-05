import 'package:equatable/equatable.dart';
import 'package:mnotes/data/models/contact.dart';
import 'package:mnotes/data/models/media.dart';
import 'package:mnotes/data/models/tag.dart';

class Note extends Equatable{
  int? id;
  String? title;
  String? description;
  Contact? contact;
  List<Media>? media;
  List<Tag>? tags;
  String? createdAt;
  String? updatedAt;

  Note(
      {this.id,
      this.title,
      this.description,
      this.contact,
      this.media,
      this.tags,
      this.createdAt,
      this.updatedAt});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((item) {
        media!.add(Media.fromJson(item));
      });
    }
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((item) {
        tags!.add(Tag.fromJson(item));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((item) => item.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((item) => item.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  List<Object?> get props => [id, title, description, contact, media, tags, createdAt, updatedAt];
}
