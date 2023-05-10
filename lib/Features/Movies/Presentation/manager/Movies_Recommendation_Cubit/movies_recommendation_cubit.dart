import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_recommendation_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_recommendation_use_case.dart';

part 'movies_recommendation_state.dart';

class MoviesRecommendationCubit extends Cubit<MoviesRecommendationState> {
  MoviesRecommendationCubit(this.getMoviesRecommendationUseCase)
      : super(MoviesRecommendationInitial());

  final GetMoviesRecommendationUseCase getMoviesRecommendationUseCase;
  Future<void> getRecommendationMovies({required int id}) async {
    emit(MoviesRecommendationLoading());
    var result = await getMoviesRecommendationUseCase
        .call(MoviesRecommendationParameters(id: id));
    result.fold((failure) {
      emit(MoviesRecommendationFailure(failure.errMessage));
    }, (recommendationMovies) {
      emit(MoviesRecommendationSuccess(recommendationMovies));
    });
  }
}
