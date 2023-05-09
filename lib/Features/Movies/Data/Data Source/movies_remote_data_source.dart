import 'package:dio/dio.dart';
import 'package:netflix_app/Features/Movies/Data/models/movie_details_model.dart';
import 'package:netflix_app/Features/Movies/Data/models/movie_model.dart';
import 'package:netflix_app/Features/Movies/Data/models/movies_recommendation.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_details_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/core/utils/Api_constance.dart';

import '../../Domain/Use Cases/movie_details_use_case.dart';
import '../../Domain/Use Cases/movie_recommendation_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieEntity>> getNowPlayingMovies();
  Future<List<MovieEntity>> getPopularMovies();

  Future<List<MovieEntity>> getTopRatedMovies();

  Future<MoviesDetailsEntity> getMoviesDetails(
      MoviesDetailsParameter parameter);
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(
      MoviesRecommendationParameters parameter);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<MoviesDetailsEntity> getMoviesDetails(
      MoviesDetailsParameter parameter) async {
    dynamic response =
        await Dio().get(ApiConstance.moviesDetailsPath(parameter.id));

    return MoviesDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(
      MoviesRecommendationParameters parameter) async {
    dynamic response =
        await Dio().get(ApiConstance.moviesRecommendationPath(parameter.id));
    List<MovieRecommendationModel> moviesRecommendationList = [];
    for (var movieMap in response.data["results"]) {
      moviesRecommendationList.add(MovieRecommendationModel.fromJson(movieMap));
    }
    return moviesRecommendationList;
  }

  @override
  Future<List<MovieEntity>> getNowPlayingMovies() async {
    dynamic response = await Dio().get(ApiConstance.nowPlayingPath);
    List<MovieEntity> movies = getmoviesList(response.data);
    return movies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    dynamic response = await Dio().get(ApiConstance.popularMoviesPath);
    List<MovieEntity> movies = getmoviesList(response.data);

    return movies;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    dynamic response = await Dio().get(ApiConstance.topRatedMoviesPath);
    List<MovieEntity> movies = getmoviesList(response.data);
    return movies;
  }

  List<MovieEntity> getmoviesList(dynamic data) {
    List<MovieEntity> movies = [];
    for (var movieMap in data["results"]) {
      movies.add(MovieModel.fromJson(movieMap));
    }
    return movies;
  }
}
