part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitialState extends TopRatedMoviesState {}

class TopRatedMoviesLoadingState extends TopRatedMoviesState {}

class TopRatedMoviesSuccessState extends TopRatedMoviesState {
  final List<MovieEntity> topRatedMovies;

  const TopRatedMoviesSuccessState(this.topRatedMovies);
}

class TopRatedMoviesFailureState extends TopRatedMoviesState {
  final String errMessage;

  const TopRatedMoviesFailureState(this.errMessage);
}
