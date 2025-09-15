import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:ecommerce_app/features/auth/managers/reset_password_view_model.dart';
import 'package:ecommerce_app/features/auth/pages/login_page.dart';
import 'package:ecommerce_app/features/auth/pages/reset_password/enter_otp_page.dart';
import 'package:ecommerce_app/features/auth/pages/reset_password/forgot_password_page.dart';
import 'package:ecommerce_app/features/auth/pages/reset_password/reset_password_page.dart';
import 'package:ecommerce_app/features/auth/pages/sign_up_page.dart';
import 'package:ecommerce_app/features/home/pages/home_page.dart';
import 'package:ecommerce_app/features/onboarding/pages/onboarding_page.dart';
import 'package:ecommerce_app/features/splash/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: Routes.homePage,
  routes: [
    GoRoute(path: Routes.onboardingPage, builder: (context, state) => OnboardingPage()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
    GoRoute(path: Routes.signUpPage, builder: (context, state) => SignUpPage()),
    GoRoute(path: Routes.homePage, builder: (context, state) => HomePage()),
    ShellRoute(
      builder: (context, state, child) => ChangeNotifierProvider(
        create: (context) => ResetPasswordViewModel(authRepo: context.read(), secureStorage: context.read()),
        child: child,
      ),
      routes: [
        GoRoute(path: Routes.enterPage, builder: (context, state) => EnterOtpPage()),
        GoRoute(path: Routes.forgotPassword, builder: (context, state) => ForgotPasswordPage()),
        GoRoute(path: Routes.resetPassword, builder: (context, state) => ResetPasswordPage()),
      ],
    ),
  ],
);
