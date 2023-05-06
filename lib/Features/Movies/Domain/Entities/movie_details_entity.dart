import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/gener_entity.dart';

class MoviesDetailsEntity extends Equatable {
  final int id;
  final int runTime;
  final String title;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final String overview;
  final List<GenreEntity> geners;

  const MoviesDetailsEntity(
      {required this.id,
      required this.runTime,
      required this.title,
      required this.backdropPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.overview,
      required this.geners});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        runTime,
        title,
        backdropPath,
        releaseDate,
        voteAverage,
        overview,
        geners
      ];
}
