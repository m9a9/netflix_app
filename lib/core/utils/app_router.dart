import 'package:go_router/go_router.dart';
import 'package:netflix_app/Features/OnBoarding/Views/onBoarding_homeView.dart';

abstract class AppRouter {
  static const kOnBoarding = 'OnBoarding';
  static final router = GoRouter(routes: [
    GoRoute(
        path: '/', builder: ((context, state) => const OnBoardingHomeView())),
  ]);
}
