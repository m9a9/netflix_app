import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_Image_item.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/now_playing_component.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movies_component.dart';
import 'package:netflix_app/core/utils/app_router.dart';

class MovieHomeView extends StatelessWidget {
  const MovieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const NowPlayingComponent(),
          MoviesComponent(
            componentTitle: 'Popular',
            movieItemImage: const MovieItemImage(),
            pushTo: () {
              GoRouter.of(context).push(AppRouter.kPopularMoviesScreen);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MoviesComponent(
            componentTitle: 'Top Rated',
            movieItemImage: const MovieItemImage(),
            pushTo: () {
              GoRouter.of(context).push(AppRouter.kTopRatedScreen);
            },
          ),
        ],
      ),
    ));
  }
}
