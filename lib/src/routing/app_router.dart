import 'package:go_router/go_router.dart';
import 'package:opacity/app.dart';
import 'package:opacity/src/features/auth/presentation/screens/home_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/landing_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/register_screen.dart';
import 'package:opacity/src/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:opacity/src/features/kyc_feature/presentation/kyc_screen.dart';
import 'package:opacity/src/routing/route_paths.dart';

// GoRouter configuration
final appRouter = GoRouter(
  //initialLocation: '/',
  routes: [
    GoRoute(
      name: RoutePaths.appScreenRoute,
      path: '/',
      builder: (context, state) => const App(),
    ),
    GoRoute(
      name: RoutePaths.homeScreenRoute,
      path: '/${RoutePaths.homeScreenRoute}',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: RoutePaths.loginScreenRoute,
      path: '/${RoutePaths.loginScreenRoute}',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: RoutePaths.registerScreenRoute,
      path: '/${RoutePaths.registerScreenRoute}',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: RoutePaths.kycScreenRoute,
      path: '/${RoutePaths.kycScreenRoute}',
      builder: (context, state) => const KYCScreen(),
    ),
    GoRoute(
      name: RoutePaths.landingScreenRoute,
      path: '/${RoutePaths.landingScreenRoute}',
      builder: (context, state) => const LandingScreen(),
    ),

  ],
);