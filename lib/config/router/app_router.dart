import 'package:go_router/go_router.dart';
import '/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/listings',
      name: ListingsScreen.name,
      builder: (context, state) => const ListingsScreen(),
    ),

    GoRoute(
      path: '/description',
      name: DescriptionScreen.name,
      builder: (context, state) => const DescriptionScreen(),
    ),
  ],
);