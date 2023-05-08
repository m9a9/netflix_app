import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/popular_movies-use_case.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitialState());
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoadingState());
    var result = await getPopularMoviesUseCase.call();
    result.fold((failure) {
      emit(PopularMoviesFaiureState(failure.errMessage));
    }, (movies) {
      emit(PopularMoviesSuccessState(movies));
    });
  }
}
