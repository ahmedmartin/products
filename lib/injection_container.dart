import 'package:clean_architecture_posts_app/product/data/datasources/products_remote_data_source.dart';
import 'package:clean_architecture_posts_app/product/data/repositories/products_repository_impl.dart';
import 'package:clean_architecture_posts_app/product/domain/repositories/products_repository.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_all_categories_usecase.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_all_products_by_category_usecase.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/categories/categories_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/product/product_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/products/products_bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => ProductBloc(getProductUseCase: sl()));
  sl.registerFactory(() => ProductsBloc(getAllProductsUseCase: sl()));
  sl.registerFactory(() => CategoriesBloc(categoriesUseCase: sl()));

// Usecases

  sl.registerLazySingleton(() => GetAllProductsByCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(sl()));
  sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));

// Repository

  sl.registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
      remoteDataSource: sl(),networkInfo: sl()));


// Datasources

  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
