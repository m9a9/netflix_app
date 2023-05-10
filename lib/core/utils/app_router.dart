import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Data/Repository/movies_repository.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/Now_Playing_movies_UseCase.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_details_use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_recommendation_use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/popular_movies-use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/top_rated_movies_use_case.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movie_home_view.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movies_details.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/popular_movies_list_view.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/top_rated_movies_List.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movie_Details_cubit/movie_details_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movies_Recommendation_Cubit/movies_recommendation_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Now_Playing_cubit/now_playing_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Popular_Movies_cubit/popular_movies_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Top_Rated_cubit/top_rated_movies_cubit.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';
import 'package:netflix_app/core/utils/functions/service_locator.dart';

abstract class AppRouter {
  static const kMoviesDetailsScreen = '/MoviesDetailsScreen';
  static const kPopularMoviesScreen = '/PopularMoviesScreen';
  static const kTopRatedScreen = '/MoreTopRatedScreen';
  static const kMovieHomeView = '/MovieHomeView';
  static final router = GoRouter(routes: [
    GoRoute(
        path: '/', builder: ((context, state) => const OnBoardingHomeView())),
    GoRoute(
        path: kMoviesDetailsScreen,
        builder: ((context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MovieDetailsCubit(
                  GetMoviesDetailsUseCase(
                    getIt.get<MoviesRepository>(),
                  ),
                )..getMoviesDetails(id: state.extra as int),
              ),
              BlocProvider(
                create: (context) => MoviesRecommendationCubit(
                  GetMoviesRecommendationUseCase(
                    getIt.get<MoviesRepository>(),
                  ),
                )..getRecommendationMovies(id: state.extra as int),
              ),
            ],
            child: MoviesDetailsView(
              id: state.extra as int,
            ),
          );
        })),
    GoRoute(
        path: kPopularMoviesScreen,
        builder: ((context, state) => const PopularmoviesList())),
    GoRoute(
      path: kMovieHomeView,
      builder: ((context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NowPlayingCubit(
                GetNowPlayingMoviesUseCase(
                  getIt.get<MoviesRepository>(),
                ),
              )..getNowPlayingMovies(),
            ),
            BlocProvider(
              create: (context) => PopularMoviesCubit(
                GetPopularMoviesUseCase(
                  getIt.get<MoviesRepository>(),
                ),
              )..getPopularMovies(),
            ),
            BlocProvider(
              create: (context) => TopRatedMoviesCubit(
                GetTopRatedMoviesUseCase(
                  getIt.get<MoviesRepository>(),
                ),
              )..getTopRatedMovies(),
            ),
          ],
          child: const MovieHomeView(),
        );
      }),
    ),
    GoRoute(
        path: kTopRatedScreen,
        builder: ((context, state) => const TopRatedMoviesList())),
  ]);
}
