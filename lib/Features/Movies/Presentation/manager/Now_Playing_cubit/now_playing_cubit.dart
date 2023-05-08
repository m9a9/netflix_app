import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/Now_Playing_movies_UseCase.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.getNowPlayingMoviesUseCase)
      : super(NowPlayingInitialState());

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingLoadingState());
    var result = await getNowPlayingMoviesUseCase.call();
    result.fold((failure) {
      emit(NowPlayingFailureState(failure.errMessage));
    }, (movies) {
      emit(NowPlayingSuccessState(movies));
    });
  }
}
