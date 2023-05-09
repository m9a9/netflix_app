import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movies_details.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/popular_movies_list_view.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/top_rated_movies_List.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';

abstract class AppRouter {
  static const kMoviesDetailsScreen = '/MoviesDetailsScreen';
  static const kPopularMoviesScreen = '/PopularMoviesScreen';
  static const kTopRatedScreen = '/MoreTopRatedScreen';
  static final router = GoRouter(routes: [
    GoRoute(
        path: '/', builder: ((context, state) => const OnBoardingHomeView())),
    GoRoute(
        path: kMoviesDetailsScreen,
        builder: ((context, state) => const MoviesDetailsView())),
    GoRoute(
        path: kPopularMoviesScreen,
        builder: ((context, state) => const PopularmoviesList())),
    GoRoute(
        path: kTopRatedScreen,
        builder: ((context, state) => const TopRatedMoviesList())),
  ]);
}
