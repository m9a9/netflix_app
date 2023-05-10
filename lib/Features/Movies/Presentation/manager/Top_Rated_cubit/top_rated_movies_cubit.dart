import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/top_rated_movies_use_case.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.getTopRatedMoviesUseCase)
      : super(TopRatedMoviesInitialState());

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  Future<void> getTopRatedMovies() async {
    emit(TopRatedMoviesLoadingState());
    var result = await getTopRatedMoviesUseCase.call();
    result.fold((failure) {
      emit(TopRatedMoviesFailureState(failure.errMessage));
    }, (movies) {
      emit(TopRatedMoviesSuccessState(movies));
    });
  }
}
