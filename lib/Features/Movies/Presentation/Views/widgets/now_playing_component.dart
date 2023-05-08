import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                ])
                .createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
          },
          child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imageUrl:
                  'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
        ),
        Positioned(
          bottom: 45,
          left: 150,
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
                      style: Styles.style18,
                    )
                  ],
                ),
                Text(
                  'Movie Name',
                  style: Styles.style18,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
