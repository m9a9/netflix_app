import 'package:netflix_app/Features/Movies/Domain/Entities/movie_recommendation_entity.dart';

class MovieRecommendationModel extends MovieRecommendationEntity {
  const MovieRecommendationModel({required super.id, super.backdropPath});

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieRecommendationModel(
        id: jsonData['id'],
        backdropPath:
            jsonData['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg');
  }
}
