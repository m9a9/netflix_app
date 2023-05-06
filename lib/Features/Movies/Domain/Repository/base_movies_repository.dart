import 'package:dartz/dartz.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_details_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_recommendation_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_details_use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_recommendation_use_case.dart';
import 'package:netflix_app/core/global/errors/failures.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetailsEntity>> getMoviesDetails(
      MoviesDetailsParameter parameter);
  Future<Either<Failure, List<MovieRecommendationEntity>>>
      getMoviesRecommendation(MoviesRecommendationParameters parameter);
}
