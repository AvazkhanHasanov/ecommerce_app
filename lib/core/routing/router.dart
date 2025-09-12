import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/features/auth/pages/login_page.dart';
import 'package:ecommerce_app/features/auth/pages/sign_up_page.dart';
import 'package:ecommerce_app/features/onboarding/pages/onboarding_page.dart';
import 'package:ecommerce_app/features/splash/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.onboardingPage, builder: (context, state) => OnboardingPage()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
    GoRoute(path: Routes.signUpPage, builder: (context, state) => SignUpPage()),
  ],
);
