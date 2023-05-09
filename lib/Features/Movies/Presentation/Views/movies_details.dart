import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/widgets/now_playing_component.dart';
import 'package:netflix_app/Features/OnBoarding/widgets/custom_Button.dart';

import '../../../../core/utils/styles.dart';

class MoviesDetailsView extends StatelessWidget {
  const MoviesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: CustomScrollView(slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const NowPlayingComponent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '4.8',
                          style: Styles.style14,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '1h 40m',
                          style: Styles.style14,
                        ),
                      ],
                    ),
                    const AspectRatio(
                      aspectRatio: 6 / 0.8,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: CustomButton(
                          title: 'Play',
                        ),
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: Styles.style12,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Genres:[Lorem ipsum dolor sit amet, consectetur adipiscing elit, .]',
                      style: Styles.style12.copyWith(color: Colors.green),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                      'More Like This',
                      style: Styles.style18.copyWith(color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 0.2,
              crossAxisSpacing: 0.4),
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                    imageUrl:
                        'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
              ),
            );
          }),
        )
      ]),
    );
  }
}
//  SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const NowPlayingComponent(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 30,
//                   width: 40,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.red,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '2020',
//                       style: Styles.style12,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const Icon(
//                   Icons.star,
//                   color: Colors.yellow,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   '4.8',
//                   style: Styles.style14,
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   '1h 40m',
//                   style: Styles.style14,
//                 ),
//               ],
//             ),
//             const AspectRatio(
//               aspectRatio: 6 / 0.8,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 child: CustomButton(
//                   title: 'Play',
//                 ),
//               ),
//             ),
//             Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//               style: Styles.style12,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               'Genres:[Lorem ipsum dolor sit amet, consectetur adipiscing elit, .]',
//               style: Styles.style12.copyWith(color: Colors.green),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(
//               width: 28,
//             ),
//             Text(
//               'More Like This',
//               style: Styles.style14.copyWith(color: Colors.grey),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 2,
//               child: GridView.builder(
//                   scrollDirection: Axis.vertical,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       childAspectRatio: 2 / 2.8,
//                       crossAxisSpacing: 2.4,
//                       mainAxisSpacing: 2.5),
//                   itemBuilder: (context, index) {
//                     return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CachedNetworkImage(
//                             imageUrl:
//                                 'https://images.unsplash.com/photo-1683345644646-1f207858e681?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'));
//                   }),
//             )
//           ],
//         ),
//       ),