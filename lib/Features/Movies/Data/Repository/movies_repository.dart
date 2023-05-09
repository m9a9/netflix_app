import 'package:dio/dio.dart';
import 'package:netflix_app/Features/Movies/Data/Data%20Source/movies_remote_data_source.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_recommendation_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_details_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/Features/Movies/Domain/Repository/base_movies_repository.dart';
import 'package:netflix_app/core/global/errors/failures.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_recommendation_use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_details_use_case.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);
  @override
  Future<Either<Failure, MoviesDetailsEntity>> getMoviesDetails(
      MoviesDetailsParameter parameter) async {
    try {
      MoviesDetailsEntity movieDetails;
      movieDetails =
          await baseMoviesRemoteDataSource.getMoviesDetails(parameter);
      return Right(movieDetails);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>>
      getMoviesRecommendation(MoviesRecommendationParameters parameter) async {
    try {
      List<MovieRecommendationEntity> movieRecommendationList;
      movieRecommendationList =
          await baseMoviesRemoteDataSource.getMoviesRecommendation(parameter);
      return Right(movieRecommendationList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    List<MovieEntity> movies;

    try {
      movies = await baseMoviesRemoteDataSource.getNowPlayingMovies();
      if (movies.isNotEmpty) {
        return Right(movies);
      }
      movies = await baseMoviesRemoteDataSource.getNowPlayingMovies();
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      List<MovieEntity> movies;
      movies = await baseMoviesRemoteDataSource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      List<MovieEntity> movies;
      movies = await baseMoviesRemoteDataSource.getTopRatedMovies();
      return Right(movies);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
