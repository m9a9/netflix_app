import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/Api_constance.dart';
import '../../manager/Movies_Recommendation_Cubit/movies_recommendation_cubit.dart';

class ShowRecommendation extends StatelessWidget {
  ShowRecommendation({super.key});
  int count = 2;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.6),
      delegate: SliverChildBuilderDelegate(childCount: 7, (context, index) {
        return BlocBuilder<MoviesRecommendationCubit,
            MoviesRecommendationState>(builder: (context, state) {
          if (state is MoviesRecommendationSuccess) {
            return count == 0
                ? Container(
                    height: 70,
                    color: Colors.red,
                    child: const Icon(Icons.error_outline),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 180,
                          placeholder: (context, _) {
                            return const Icon(Icons.no_backpack_rounded);
                          },
                          imageUrl: ApiConstance.imageUrlPath(
                              state.recommendationMovies[index].backdropPath!)),
                    ),
                  );
          } else if (state is MoviesRecommendationFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
      }),
    );
  }
}
