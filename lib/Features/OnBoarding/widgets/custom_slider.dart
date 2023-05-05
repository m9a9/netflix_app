import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.fill)),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              maxLines: 2,
              style: Styles.style20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              subTitle,
              maxLines: 3,
              style: Styles.style18,
            ),
          ),
        ],
      ),
    );
  }
}
