import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/movie_entity.dart';
import 'package:netflix_app/core/global/app_colors/dark_theme_colors.dart';
import 'package:netflix_app/core/utils/Api_constance.dart';
import 'package:netflix_app/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
    required this.movie,
  });
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMoviesDetailsScreen, extra: movie.id);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.94,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: DarkThemeColors.backgroundColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  height: 170,
                  imageUrl: ApiConstance.imageUrlPath(movie.backdropPath),
                  imageBuilder: (context, imageProvider) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            movie.title,
                            style: Styles.style20,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: DarkThemeColors.backgroundColor),
                            child: Center(
                              child: Text(
                                movie.releaseDate,
                                style: Styles.style14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            '(${movie.voteAverage})'.substring(1, 4),
                            style: Styles.style14,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(movie.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.style14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
