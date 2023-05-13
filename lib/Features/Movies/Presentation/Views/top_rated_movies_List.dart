import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movies_details.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_List_item.dart';
import 'package:netflix_app/Features/Movies/Presentation/manager/Top_Rated_cubit/top_rated_movies_cubit.dart';

import '../../../../core/utils/styles.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

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
            'Top Rated Movies',
            style: Styles.style18,
          ),
        ),
        body: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
            builder: (context, state) {
          if (state is TopRatedMoviesSuccessState) {
            return SizedBox(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoviesDetailsView(
                                      id: state.topRatedMovies[index].id,
                                    )));
                      },
                      child: MovieListItem(
                        movie: state.topRatedMovies[index],
                      ),
                    );
                  }),
            );
          } else if (state is TopRatedMoviesFailureState) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
