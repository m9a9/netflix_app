import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'movie_Image_item.dart';

class MoviesComponent extends StatelessWidget {
  const MoviesComponent(
      {super.key,
      required this.componentTitle,
      required this.movieItemImage,
      this.pushTo});
  final String componentTitle;
  final MovieItemImage movieItemImage;
  final void Function()? pushTo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  componentTitle,
                  style: Styles.style20.copyWith(letterSpacing: 2.4),
                ),
                GestureDetector(
                  onTap: pushTo,
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        style: Styles.style14.copyWith(color: Colors.grey),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.grey,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const MovieItemImage(),
          ],
        ),
      ),
    );
  }
}
