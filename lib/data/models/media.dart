import 'package:mnotes/data/models/note.dart';
import 'package:mnotes/data/models/tag.dart';
import 'package:equatable/equatable.dart';

class Media extends Equatable {
  int? id;
  String? filename;
  String? mimeType;
  int? downloadCount;
  String? link;
  Note? note;
  List<Tag>? tags;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.id,
      this.filename,
      this.mimeType,
      this.downloadCount,
      this.link,
      this.note,
      this.tags,
      this.createdAt,
      this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    mimeType = json['mime_type'];
    downloadCount = json['download_count'];
    link = json['link'];
    note = json['note'] != null ? Note.fromJson(json['note']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['mime_type'] = mimeType;
    data['download_count'] = downloadCount;
    data['link'] = link;
    if (note != null) {
      data['note'] = note!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((item) => item.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  @override
  List<Object?> get props => [id, filename, mimeType, downloadCount, link, note, tags, createdAt, updatedAt];
}