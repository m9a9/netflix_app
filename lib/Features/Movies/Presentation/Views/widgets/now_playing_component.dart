import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Now_Playing_cubit/now_playing_cubit.dart';
import 'package:netflix_app/core/global/app_colors/dark_theme_colors.dart';
import 'package:netflix_app/core/utils/Api_constance.dart';
import 'package:netflix_app/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
      if (state is NowPlayingSuccessState) {
        return Hero(
          tag: 'tag',
          child: CarouselSlider.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index, _) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kMoviesDetailsScreen,
                        extra: state.movies[index].id);
                  },
                  child: Stack(
                    children: [
                      ShaderMask(
                        blendMode: BlendMode.dstIn,
                        shaderCallback: (bounds) {
                          return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [
                                0,
                                0.3,
                                0.5,
                                1
                              ]).createShader(
                              Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              height: 500,
                              width: MediaQuery.of(context).size.width - 20,
                              fit: BoxFit.cover,
                              imageUrl: ApiConstance.imageUrlPath(
                                  state.movies[index].backdropPath),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Positioned(
                          bottom: MediaQuery.of(context).size.width / 5,
                          left: MediaQuery.of(context).size.width / 5,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Now Playing',
                                      style: Styles.style20,
                                    )
                                  ],
                                ),
                                Text(
                                  state.movies[index].title,
                                  style: Styles.style20,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                aspectRatio: 15.2 / 15.1,
                // height: 400,
                autoPlayCurve: Curves.easeInOut,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
              )),
        );
      } else if (state is NowPlayingFailureState) {
        return Text(state.errMessage);
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
