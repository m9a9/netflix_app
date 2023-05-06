import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genreIds;

  const MovieEntity(
      {required this.id,
      required this.backdropPath,
      required this.title,
      required this.releaseDate,
      required this.overview,
      required this.voteAverage,
      required this.genreIds});

  @override
  List<Object?> get props =>
      [id, backdropPath, title, releaseDate, overview, voteAverage, genreIds];
}
