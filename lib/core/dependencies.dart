import 'package:ecommerce_app/core/auth_interceptor.dart';
import 'package:ecommerce_app/core/client.dart';
import 'package:ecommerce_app/data/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final dependencies = <SingleChildWidget>[
  Provider(create: (context) => FlutterSecureStorage()),
  Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  Provider(create: (context) => ApiClient(interceptor: context.read())),
  Provider(
    create: (context) => AuthRepository(secureStorage: context.read(), client: context.read()),
  ),
];
