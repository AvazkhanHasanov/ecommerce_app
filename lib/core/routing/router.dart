import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce_app/core/routing/routes.dart';
import '../../features/address/pages/address_page.dart';
import '../../features/order/pages/order_page.dart';
import '../../features/payment/pages/payment_page.dart';
import '../../features/checkout/pages/checkout_page.dart';
import '../../features/help_center/pages/help_center_page.dart';
import 'package:ecommerce_app/features/home/pages/home_page.dart';
import '../../features/notification/pages/notification_page.dart';
import 'package:ecommerce_app/features/cart/pages/cart_page.dart';
import 'package:ecommerce_app/features/auth/pages/login_page.dart';
import 'package:ecommerce_app/features/saved/pages/saved_page.dart';
import '../../features/auth/managers/reset_password_view_model.dart';
import 'package:ecommerce_app/features/auth/pages/sign_up_page.dart';
import '../../features/auth/pages/reset_password/enter_otp_page.dart';
import 'package:ecommerce_app/features/splash/pages/splash_page.dart';
import 'package:ecommerce_app/features/search/pages/search_page.dart';
import '../../features/product_detail/pages/product_detail_pages.dart';
import 'package:ecommerce_app/features/account/pages/account_page.dart';
import 'package:ecommerce_app/features/new_card/pages/new_card_page.dart';
import 'package:ecommerce_app/features/question/pages/question_page.dart';
import '../../features/auth/pages/reset_password/reset_password_page.dart';
import '../../features/auth/pages/reset_password/forgot_password_page.dart';
import 'package:ecommerce_app/features/my_details/pages/my_detail_page.dart';
import 'package:ecommerce_app/features/onboarding/pages/onboarding_page.dart';
import '../../features/account_notification/pages/account_notification_page.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.account, builder: (context, state) => AccountPage()),
    GoRoute(path: Routes.accountNotification, builder: (context, state) => AccountNotificationPage()),
    GoRoute(path: Routes.address, builder: (context, state) => AddressPage()),
    GoRoute(path: Routes.cart, builder: (context, state) => CartPage()),
    GoRoute(path: Routes.checkout, builder: (context, state) => CheckoutPage()),

    GoRoute(path: Routes.homePage, builder: (context, state) => HomePage()),
    GoRoute(path: Routes.helpCenter, builder: (context, state) => HelpCenterPage()),
    GoRoute(path: Routes.onboardingPage, builder: (context, state) => OnboardingPage()),
    GoRoute(path: Routes.order, builder: (context, state) => OrderPage()),
    GoRoute(path: Routes.myDetail, builder: (context, state) => MyDetailPage()),
    GoRoute(path: Routes.newCard, builder: (context, state) => NewCardPage()),
    GoRoute(path: Routes.notification, builder: (context, state) => NotificationPage()),

    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.question, builder: (context, state) => QuestionPage()),
    GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
    GoRoute(path: Routes.signUpPage, builder: (context, state) => SignUpPage()),
    GoRoute(path: Routes.search, builder: (context, state) => SearchPage()),
    GoRoute(path: Routes.saved, builder: (context, state) => SavedPage()),
    GoRoute(path: Routes.payment, builder: (context, state) => PaymentPage()),
    GoRoute(
      path: Routes.productDetail,
      builder: (context, state) => ProductDetailPages(id: int.parse(state.pathParameters['id']!)),
    ),
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
