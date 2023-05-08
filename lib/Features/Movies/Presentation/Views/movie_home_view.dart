import 'package:flutter/material.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_Image_item.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/now_playing_component.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movies_component.dart';

class MovieHomeView extends StatelessWidget {
  const MovieHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: const [
          NowPlayingComponent(),
          MoviesComponent(
            componentTitle: 'Popular',
            movieItemImage: MovieItemImage(),
          ),
          SizedBox(
            height: 20,
          ),
          MoviesComponent(
            componentTitle: 'Top Rated',
            movieItemImage: MovieItemImage(),
          ),
        ],
      ),
    ));
  }
}
