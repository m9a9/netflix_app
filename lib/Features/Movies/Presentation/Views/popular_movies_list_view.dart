import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_List_item.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Popular_Movies_cubit/popular_movies_cubit.dart';
import 'package:netflix_app/core/utils/styles.dart';

import 'movies_details.dart';

class PopularmoviesList extends StatelessWidget {
  const PopularmoviesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            )),
        centerTitle: true,
        title: Text(
          'Popular Movies',
          style: Styles.style18,
        ),
      ),
      body: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesSuccessState) {
            return SizedBox(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings: RouteSettings(
                                arguments: state.popularMovies[index].id),
                            builder: (context) => MoviesDetailsView(
                              id: ModalRoute.of(context)!.settings.arguments
                                  as int,
                            ),
                          ),
                        );
                      },
                      child: MovieListItem(
                        movie: state.popularMovies[index],
                      ),
                    );
                  }),
            );
          } else if (state is PopularMoviesFaiureState) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
