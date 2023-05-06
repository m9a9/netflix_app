import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.releaseDate,
      required super.overview,
      required super.voteAverage,
      required super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieModel(
      id: jsonData['id'],
      backdropPath: jsonData['backdrop_path'],
      title: jsonData['title'],
      releaseDate: jsonData['release_date'],
      overview: jsonData['overview'],
      voteAverage: jsonData['vote_average'].toDouble(),
      genreIds: List<int>.from(jsonData["genre_ids"].map((e) => e)),
    );
  }
}
