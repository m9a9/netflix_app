import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Top_Rated_cubit/top_rated_movies_cubit.dart';

import '../../../../../core/global/app_colors/dark_theme_colors.dart';
import '../../../../../core/utils/Api_constance.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class TopRatedMovieItemImage extends StatelessWidget {
  const TopRatedMovieItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        builder: (context, state) {
      if (state is TopRatedMoviesSuccessState) {
        return AspectRatio(
          aspectRatio: 3 / 1.4,
          child: ListView.builder(
              itemCount: state.topRatedMovies.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kMoviesDetailsScreen);
                      },
                      child: CachedNetworkImage(
                        imageUrl: ApiConstance.imageUrlPath(
                            state.topRatedMovies[index].backdropPath),
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(image: imageProvider)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  state.topRatedMovies[index].title,
                                  style: Styles.style18,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }),
        );
      } else if (state is TopRatedMoviesFailureState) {
        return Center(
          child: Text(
            state.errMessage,
            style: Styles.style18,
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: DarkThemeColors.primaryColor,
          ),
        );
      }
    });
  }
}
