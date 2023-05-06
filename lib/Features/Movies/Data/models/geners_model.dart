import 'package:netflix_app/Features/Movies/Domain/Entities/gener_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> jsonData) {
    return GenreModel(id: jsonData['id'], name: jsonData['name']);
  }
}
