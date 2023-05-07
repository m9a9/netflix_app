import 'package:dio/dio.dart';
import 'package:netflix_app/Features/Movies/Data/models/movie_details_model.dart';
import 'package:netflix_app/Features/Movies/Data/models/movie_model.dart';
import 'package:netflix_app/Features/Movies/Data/models/movies_recommendation.dart';
import 'package:netflix_app/core/utils/Api_constance.dart';

import '../../Domain/Use Cases/movie_details_use_case.dart';
import '../../Domain/Use Cases/movie_recommendation_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MoviesDetailsModel> getMoviesDetails(MoviesDetailsParameter parameter);
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(
      MoviesRecommendationParameters parameter);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<MoviesDetailsModel> getMoviesDetails(
      MoviesDetailsParameter parameter) async {
    dynamic data =
        await Dio().get(ApiConstance.moviesDetailsPath(parameter.id));

    return MoviesDetailsModel.fromJson(data);
  }

  @override
  Future<List<MovieRecommendationModel>> getMoviesRecommendation(
      MoviesRecommendationParameters parameter) async {
    dynamic data =
        await Dio().get(ApiConstance.moviesRecommendationPath(parameter.id));
    List<MovieRecommendationModel> moviesRecommendationList = [];
    for (var movieMap in data["results"]) {
      moviesRecommendationList.add(MovieRecommendationModel.fromJson(movieMap));
    }
    return moviesRecommendationList;
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    dynamic data = await Dio().get(ApiConstance.nowPlayingPath);
    List<MovieModel> movies = getmoviesList(data);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    dynamic data = await Dio().get(ApiConstance.popularMoviesPath);
    List<MovieModel> movies = getmoviesList(data);
    return movies;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    dynamic data = await Dio().get(ApiConstance.topRatedMoviesPath);
    List<MovieModel> movies = getmoviesList(data);
    return movies;
  }

  List<MovieModel> getmoviesList(data) {
    List<MovieModel> movies = [];
    for (var movieMap in data["results"]) {
      movies.add(MovieModel.fromJson(movieMap));
    }
    return movies;
  }
}
