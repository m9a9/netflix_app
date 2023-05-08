import 'package:flutter/material.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_item.dart';

import '../../../../core/utils/styles.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
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
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return const MovieItem();
        }),
      ),
    );
  }
}
