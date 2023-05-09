import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kMoviesDetailsScreen);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.94,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.blueGrey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                  imageBuilder: (context, imageProvider) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.25,
                        height: MediaQuery.of(context).size.width / 2.8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            'All the Bright Places',
                            style: Styles.style20,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
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
                                '2020',
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
                          Text(
                            '4.8',
                            style: Styles.style14,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Text(
                              '100% Australian Angus grain-fed beef with cheese and pickles.  Served with fries',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.style14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
