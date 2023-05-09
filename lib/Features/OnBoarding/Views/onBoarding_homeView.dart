import 'package:flutter/material.dart';
import 'package:netflix_app/Features/Movies/Presentation/Views/movie_home_view.dart';

import '../widgets/custom_Button.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/custom_slider.dart';

class OnBoardingHomeView extends StatefulWidget {
  const OnBoardingHomeView({super.key});

  @override
  State<OnBoardingHomeView> createState() => _OnBoardingHomeViewState();
}

class _OnBoardingHomeViewState extends State<OnBoardingHomeView> {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Image(
              image: AssetImage(
                'assets/images/Logo.png',
              ),
            ),
            Expanded(
                child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentIndex = page;
                });
              },
              children: const [
                CustomSlider(
                    image: "assets/images/p1.png",
                    title: "Watch on any Device",
                    subTitle:
                        "Stream on your phone, tablet, laptop, and TV without paying more."),
                CustomSlider(
                    image: "assets/images/p2.png",
                    title: "Download and go",
                    subTitle:
                        "Save your data, watch offline on a plane, train, or submarine..."),
                CustomSlider(
                    image: "assets/images/p3.png",
                    title: "No pesky contracts",
                    subTitle: "Join today, cancel anytime."),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            CustomIndicator(cindex: _currentIndex),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              title: 'Get Started',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MovieHomeView()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
