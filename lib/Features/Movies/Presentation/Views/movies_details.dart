import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/now_playing_component.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movie_Details_cubit/movie_details_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movies_Recommendation_Cubit/movies_recommendation_cubit.dart';
import 'package:netflix_app/Features/OnBoarding/widgets/custom_Button.dart';
import 'package:netflix_app/core/global/app_colors/dark_theme_colors.dart';

import '../../../../core/utils/styles.dart';

class MoviesDetailsView extends StatelessWidget {
  const MoviesDetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const NowPlayingComponent(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
                    builder: (context, state) {
                  if (state is MovieDetailsSuccess) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    state.movieDetails.releaseDate,
                                    style: Styles.style12,
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
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                state.movieDetails.voteAverage.toString(),
                                style: Styles.style14,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                state.movieDetails.runTime.toString(),
                                style: Styles.style14,
                              ),
                            ],
                          ),
                          const AspectRatio(
                            aspectRatio: 6 / 0.8,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: CustomButton(
                                title: 'Play',
                              ),
                            ),
                          ),
                          Text(state.movieDetails.overview,
                              style: Styles.style12,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                          Text(
                            'Genres:[${state.movieDetails.geners}]',
                            style: Styles.style12.copyWith(color: Colors.green),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          Text(
                            'More Like This',
                            style: Styles.style18.copyWith(color: Colors.grey),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]);
                  } else if (state is MovieDetailsFailure) {
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
                })),
          ]),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 0.2,
              crossAxisSpacing: 0.4),
          delegate: SliverChildBuilderDelegate((context, index) {
            return BlocBuilder<MoviesRecommendationCubit,
                MoviesRecommendationState>(builder: (context, state) {
              if (state is MoviesRecommendationSuccess) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                  ),
                );
              } else if (state is MoviesRecommendationFailure) {
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
          }),
        ),

        // BlocBuilder<MoviesRecommendationCubit, MoviesRecommendationState>(
        //     builder: (context, state) {
        //   if (state is MoviesRecommendationSuccess) {
        //     return SliverGrid(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 3,
        //           childAspectRatio: 0.7,
        //           mainAxisSpacing: 0.2,
        //           crossAxisSpacing: 0.4),
        //       delegate: SliverChildBuilderDelegate((context, index) {
        //         return Padding(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(12),
        //             child: CachedNetworkImage(
        //                 imageUrl:
        //                     'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
        //           ),
        //         );
        //       }),
        //     );
        //   } else if (state is MoviesRecommendationFailure) {
        //     return Center(
        //       child: Text(
        //         state.errMessage,
        //         style: Styles.style18,
        //       ),
        //     );
        //   } else {
        //     return Center(
        //       child: CircularProgressIndicator(
        //         color: DarkThemeColors.primaryColor,
        //       ),
        //     );
        //   }
        // })
      ]),
    );
  }
}
