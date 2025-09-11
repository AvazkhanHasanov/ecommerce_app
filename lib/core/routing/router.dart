import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/features/auth/sign_up/pages/sign_up_page.dart';
import 'package:ecommerce_app/features/onboarding/pages/onboarding_page.dart';
import 'package:ecommerce_app/features/splash/pages/splash_page.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(path: Routes.onboardingPage, builder: (context, state) => OnboardingPage()),
      GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
      GoRoute(path: Routes.signUpPage, builder: (context, state) => SignUpPage())
    ]
);

