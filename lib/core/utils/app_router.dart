import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movie_home_view.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/popular_movies_list_view.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/top_rated_movies_List.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';

import '../../Features/Movies/Presentation/Views/movies_details.dart';

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
          final id = state.extra;
          return MoviesDetailsView(
            id: id as dynamic,
          );
        })),
    GoRoute(
        path: kPopularMoviesScreen,
        builder: ((context, state) => const PopularmoviesList())),
    GoRoute(
      path: kMovieHomeView,
      builder: ((context, state) => const MovieHomeView()),
    ),
    GoRoute(
        path: kTopRatedScreen,
        builder: ((context, state) => const TopRatedMoviesList())),
  ]);
}
