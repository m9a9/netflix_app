import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_details_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_details_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.getMoviesDetailsUseCase)
      : super(MovieDetailsInitial());

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  Future<void> getMoviesDetails({required int id}) async {
    emit(MovieDetailsLoading());
    final result =
        await getMoviesDetailsUseCase.call(MoviesDetailsParameter(id: id));
    result.fold((failure) {
      emit(MovieDetailsFailure(failure.errMessage));
    }, (movieDetails) {
      emit(MovieDetailsSuccess(movieDetails));
    });
  }
}
