import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Features/Movies/Data/Repository/movies_repository.dart';
import 'package:netflix_app/Features/Movies/Domain/Entities/gener_entity.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_details_use_case.dart';
import 'package:netflix_app/Features/Movies/Domain/Use%20Cases/movie_recommendation_use_case.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/show_recommendation.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movie_Details_cubit/movie_details_cubit.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Movies_Recommendation_Cubit/movies_recommendation_cubit.dart';
import 'package:netflix_app/core/global/app_colors/dark_theme_colors.dart';
import 'package:netflix_app/core/utils/Api_constance.dart';
import 'package:netflix_app/core/utils/functions/service_locator.dart';

import '../../../../core/utils/styles.dart';
import '../../../OnBoarding/widgets/custom_Button.dart';

class MoviesDetailsView extends StatelessWidget {
  const MoviesDetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieDetailsCubit(
            GetMoviesDetailsUseCase(getIt.get<MoviesRepository>()),
          )..getMoviesDetails(id: id),
        ),
        BlocProvider(
          create: (context) => MoviesRecommendationCubit(
            GetMoviesRecommendationUseCase(getIt.get<MoviesRepository>()),
          )..getRecommendationMovies(id: id),
        ),
      ],
      child: const Scaffold(body: MovieDetailsBody()),
    );
  }
}

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key});
  String _showGenres(List<GenreEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
      if (state is MovieDetailsSuccess) {
        return Hero(
          tag: 'tag',
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text(
                  state.movieDetails.title,
                  style: Styles.style20,
                ),
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                collapsedHeight: 80,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.grey,
                          Colors.black,
                          Colors.grey,
                        ],
                        stops: [0.0, 0.5, 1.0, 1.0],
                      ).createShader(
                        Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl: ApiConstance.imageUrlPath(
                          state.movieDetails.backdropPath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: DarkThemeColors.backgroundColor,
                      ),
                      child: Center(
                        child: Text(
                          state.movieDetails.releaseDate,
                          style: Styles.style14,
                          textAlign: TextAlign.center,
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
                      '(${state.movieDetails.voteAverage})'.substring(1, 4),
                      style: Styles.style14,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      _showDuration(state.movieDetails.runTime),
                      style: Styles.style14,
                    ),
                  ],
                ),
                const AspectRatio(
                  aspectRatio: 6 / 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: CustomButton(
                      title: 'Play',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(state.movieDetails.overview,
                      style: Styles.style12,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    _showGenres(state.movieDetails.geners),
                    style: Styles.style12.copyWith(color: Colors.green),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    'More Like This',
                    style: Styles.style18.copyWith(color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ])),
              ShowRecommendation()
            ],
          ),
        );
      } else if (state is MovieDetailsFailure) {
        return Center(
          child: Text(state.errMessage),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
