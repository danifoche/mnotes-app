import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  String? name;
  String? color;

  Tag({this.name, this.color});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    return data;
  }

  @override
  List<Object?> get props => [name, color];
}