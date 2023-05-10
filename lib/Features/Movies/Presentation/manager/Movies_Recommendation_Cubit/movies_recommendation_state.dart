part of 'movies_recommendation_cubit.dart';

abstract class MoviesRecommendationState extends Equatable {
  const MoviesRecommendationState();

  @override
  List<Object> get props => [];
}

class MoviesRecommendationInitial extends MoviesRecommendationState {}

class MoviesRecommendationLoading extends MoviesRecommendationState {}

class MoviesRecommendationSuccess extends MoviesRecommendationState {
  final List<MovieRecommendationEntity> recommendationMovies;

  const MoviesRecommendationSuccess(this.recommendationMovies);
}

class MoviesRecommendationFailure extends MoviesRecommendationState {
  final String errMessage;

  const MoviesRecommendationFailure(this.errMessage);
}
