// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:movie_ticket/src/screens/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    // GoRoute(
    //   name: 'page2',
    //   path: '/page2',
    //   builder: (context, state) => Page2Screen(),
    // ),
  ],
);