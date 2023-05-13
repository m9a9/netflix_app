import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/top_rated_movie_image_item.dart';
import 'package:netflix_app/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';
import 'popular_movie_Image_item.dart';

class MoviesComponent extends StatelessWidget {
  const MoviesComponent({
    super.key,
    required this.componentTitle,
    required this.movieItemImage,
  });
  final String componentTitle;
  final PopularMovieItemImage movieItemImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  componentTitle,
                  style: Styles.style20.copyWith(letterSpacing: 2.4),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        componentTitle == 'Popular'
                            ? GoRouter.of(context)
                                .push(AppRouter.kPopularMoviesScreen)
                            : GoRouter.of(context)
                                .push(AppRouter.kTopRatedScreen);
                      },
                      child: Text(
                        'See More',
                        style: Styles.style14.copyWith(color: Colors.grey),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            componentTitle == 'Popular'
                ? const PopularMovieItemImage()
                : const TopRatedMovieItemImage(),
          ],
        ),
      ),
    );
  }
}
