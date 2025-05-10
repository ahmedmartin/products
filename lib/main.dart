import 'package:clean_architecture_posts_app/product/presentation/bloc/categories/categories_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/product/product_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/products/products_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/pages/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<CategoriesBloc>()..add(const GetAllCategoriesEvent())),
          BlocProvider(
              create: (_) => di.sl<ProductBloc>()),
          BlocProvider(
              create: (_) => di.sl<ProductsBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            title: 'Products App',
            home: const CategoriesPage()));
  }
}
