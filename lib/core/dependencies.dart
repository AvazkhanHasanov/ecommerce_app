import 'package:ecommerce_app/data/repositories/device_repository.dart';
import 'package:ecommerce_app/data/repositories/question_category_repository.dart';
import 'package:ecommerce_app/data/repositories/question_repository.dart';
import 'package:ecommerce_app/data/repositories/size_repository.dart';
import 'package:ecommerce_app/features/customer_service/managers/chat_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/core/client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/cart/managers/cart_bloc.dart';
import 'package:provider/single_child_widget.dart';
import '../data/repositories/reviews_repository.dart';
import 'package:ecommerce_app/core/auth_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ecommerce_app/features/home/managers/home_bloc.dart';
import 'package:ecommerce_app/data/repositories/card_repository.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:ecommerce_app/data/repositories/order_repository.dart';
import 'package:ecommerce_app/features/search/manages/search_bloc.dart';
import 'package:ecommerce_app/data/repositories/address_repository.dart';
import 'package:ecommerce_app/data/repositories/product_repository.dart';
import 'package:ecommerce_app/data/repositories/category_repository.dart';
import 'package:ecommerce_app/data/repositories/cart_item_repository.dart';
import 'package:ecommerce_app/data/repositories/notification_repository.dart';
import 'package:ecommerce_app/features/notification/managers/notification_cubit.dart';

import '../features/new_address/manager/new_address_bloc.dart';

final dependencies = <SingleChildWidget>[
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(create: (context) => ApiClient(interceptor: context.read())),
  RepositoryProvider(create: (context) => AddressRepository(client: context.read())),
  Provider(
    create: (context) => AuthRepository(secureStorage: context.read(), client: context.read()),
  ),
  RepositoryProvider(create: (context) => CartItemRepository(client: context.read())),
  RepositoryProvider(create: (context) => CardRepository(client: context.read())),
  RepositoryProvider(create: (context) => CategoryRepository(client: context.read())),
  RepositoryProvider(create: (context) => DeviceRepository(client: context.read())),
  RepositoryProvider(create: (context) => NotificationRepository(client: context.read())),
  RepositoryProvider(create: (context) => OrderRepository(client: context.read())),
  RepositoryProvider(create: (context) => ProductRepository(client: context.read())),
  RepositoryProvider(create: (context) => QuestionCategoryRepository(client: context.read())),
  RepositoryProvider(create: (context) => QuestionRepository(client: context.read())),
  RepositoryProvider(create: (context) => ReviewsRepository(client: context.read())),
  RepositoryProvider(create: (context) => SizeRepository(client: context.read())),
];


final blocDependencies = <SingleChildWidget>[
  BlocProvider(
    create: (context) {
      final cubit = NotificationCubit(notificationRepo: context.read());
      cubit.fetchNotification();
      return cubit;
    },
  ),

  BlocProvider(
    create: (context) =>
        HomeBloc(
            categoryRepo: context.read(),
            productRepo: context.read(),
            authRepo: context.read(),
            sizeRepo: context.read(),
          )
          ..add(FetchProductsEvent())
          ..add(FetchCategoryEvent())..add(FetchSize()),
  ),
  BlocProvider(create: (context) => SearchBloc(productRepo: context.read())),
  BlocProvider(create: (context) => CartBloc(myCartItemsRepo: context.read())..add(GetMyCartItems())),
  BlocProvider(create: (context) => NewAddressBloc(addressRepo: context.read())),
  BlocProvider(create: (context) => ChatBloc()),
];
