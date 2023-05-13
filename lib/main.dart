import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/global/app_theme/themeData_dark.dart';
import 'package:netflix_app/core/utils/service_locator.dart';

import 'Features/Movies/Data/Repository/movies_repository.dart';
import 'Features/Movies/Domain/Use Cases/Now_Playing_movies_UseCase.dart';
import 'Features/Movies/Domain/Use Cases/popular_movies-use_case.dart';
import 'Features/Movies/Domain/Use Cases/top_rated_movies_use_case.dart';
import 'Features/Movies/Presentation/manager/Now_Playing_cubit/now_playing_cubit.dart';
import 'Features/Movies/Presentation/manager/Popular_Movies_cubit/popular_movies_cubit.dart';
import 'Features/Movies/Presentation/manager/Top_Rated_cubit/top_rated_movies_cubit.dart';
import 'core/utils/app_router.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: getDarkThemeData(),
      ),
    );
  }
}
