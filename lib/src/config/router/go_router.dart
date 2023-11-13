import 'package:go_router/go_router.dart';
import 'package:travel/src/config/router/app_routes.dart';
import 'package:travel/src/presentation/views/onboarding/onbourding_screen.dart';
import 'package:travel/src/presentation/views/splash/splash.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/on_boarding',
      name: AppRoutes.onBoarding,
      builder: (context, state) => const OnBoardingScreen(),
    ),
  ],
);
