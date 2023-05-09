import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/core/utils/app_router.dart';

class MovieItemImage extends StatelessWidget {
  const MovieItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 1.4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kMoviesDetailsScreen);
                  },
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                ),
              ),
            );
          }),
    );
  }
}
