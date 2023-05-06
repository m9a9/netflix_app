import 'package:netflix_app/Features/Movies/Data/models/geners_model.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_details_entity.dart';

class MoviesDetailsModel extends MoviesDetailsEntity {
  const MoviesDetailsModel(
      {required super.id,
      required super.runTime,
      required super.title,
      required super.backdropPath,
      required super.releaseDate,
      required super.voteAverage,
      required super.overview,
      required super.geners});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MoviesDetailsModel(
      id: jsonData['id'],
      runTime: jsonData['runtime'],
      title: jsonData['title'],
      backdropPath: jsonData['backdrop_path'],
      releaseDate: jsonData['release_date'],
      voteAverage: jsonData['vote_average'].toDouble(),
      overview: jsonData['overview'],
      geners: List<GenreModel>.from(
        jsonData['genres'].map(
          (e) => GenreModel.fromJson(e),
        ),
      ),
    );
  }
}
