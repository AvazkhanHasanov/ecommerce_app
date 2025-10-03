class Routes {
  static final account = '/account';
  static final accountNotification = '/accountNotification';
  static final cart = '/cart';
  static final enterPage = '/enterPage';
  static final forgotPassword = '/forgotPassword';
  static final helpCenter = '/helpCenter';
  static final homePage = '/homePage';
  static final login = '/login';
  static final myDetail = '/myDetail';
  static final newCard = '/newCard';
  static final notification = '/notification';
  static final onboardingPage = '/onboardingPage';
  static final payment = '/payment';
  static final productDetail = '/productDetail/:id';
  static final question = '/question';

  static String getProductDetail(int id) => '/productDetail/$id';
  static final resetPassword = '/resetPassword';
  static final saved = '/saved';
  static final search = '/search';
  static final signUpPage = '/signUpPage';
  static final splash = '/splash';
}
