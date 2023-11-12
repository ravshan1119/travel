import 'package:go_router/go_router.dart';
import 'package:travel/src/presentation/views/splash/splash.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/on_boarding',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
