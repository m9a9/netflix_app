import 'package:flutter/material.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/movie_item.dart';
import 'package:netflix_app/core/utils/styles.dart';

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
            onPressed: () {},
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
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return const MovieItem();
        }),
      ),
    );
  }
}
