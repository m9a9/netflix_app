part of 'now_playing_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitialState extends NowPlayingState {}

class NowPlayingLoadingState extends NowPlayingState {}

class NowPlayingSuccessState extends NowPlayingState {
  final List<MovieEntity> movies;

  const NowPlayingSuccessState(this.movies);
}

class NowPlayingFailureState extends NowPlayingState {
  final String errMessage;

  const NowPlayingFailureState(this.errMessage);
}
