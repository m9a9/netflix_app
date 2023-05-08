part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitialState extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesSuccessState extends PopularMoviesState {
  final List<MovieEntity> popularMovies;

  const PopularMoviesSuccessState(this.popularMovies);
}

class PopularMoviesFaiureState extends PopularMoviesState {
  final String errMessage;

  const PopularMoviesFaiureState(this.errMessage);
}
