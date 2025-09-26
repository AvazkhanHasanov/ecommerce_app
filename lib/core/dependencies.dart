import 'package:ecommerce_app/core/auth_interceptor.dart';
import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/cart_item_repository.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/notification_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/repositories/reviews_repository.dart';
import 'package:ecommerce_app/features/home/managers/home_bloc.dart';
import 'package:ecommerce_app/features/notification/managers/notification_cubit.dart';
import 'package:ecommerce_app/features/search/manages/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final dependencies = <SingleChildWidget>[
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(create: (context) => ApiClient(interceptor: context.read())),
  RepositoryProvider(create: (context) => CategoryRepository(client: context.read())),
  RepositoryProvider(create: (context) => ProductRepository(client: context.read())),
  RepositoryProvider(create: (context) => NotificationRepository(client: context.read())),
  RepositoryProvider(create: (context) => ReviewsRepository(client: context.read())),
  RepositoryProvider(create: (context) => CartItemRepository(client: context.read())),
  Provider(
    create: (context) => AuthRepository(secureStorage: context.read(), client: context.read()),
  ),
  BlocProvider(
    create: (context) {
      final cubit = NotificationCubit(notificationRepo: context.read());
      cubit.fetchNotification();
      return cubit;
    },
  ),
  BlocProvider(
    create: (context) => HomeBloc(categoryRepo: context.read(), productRepo: context.read(), authRepo: context.read())
      ..add(FetchProductsEvent())
      ..add(FetchCategoryEvent()),
  ),
  BlocProvider(create: (context) => SearchBloc(productRepo: context.read())),

];
