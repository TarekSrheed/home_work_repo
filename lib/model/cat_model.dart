// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';

import 'package:clean_service/model/handel_model.dart';
part 'cat_model.g.dart';
@HiveType(typeId: 1)
class CatModel extends ResultModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String origin;
  CatModel({
    required this.name,
    required this.image,
    required this.origin,
  });

  CatModel copyWith({
    String? name,
    String? image,
    String? origin,
  }) {
    return CatModel(
      name: name ?? this.name,
      image: image ?? this.image,
      origin: origin ?? this.origin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'origin': origin,
    };
  }

  factory CatModel.fromMap(Map<String, dynamic> map) {
    return CatModel(
      name: map['name'] as String,
      image: map['image'] as String,
      origin: map['origin'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatModel.fromJson(String source) =>
      CatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CatModel(name: $name, image: $image, origin: $origin)';

  @override
  bool operator ==(covariant CatModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.image == image && other.origin == origin;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ origin.hashCode;
}
