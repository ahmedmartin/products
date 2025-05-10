import 'package:clean_architecture_posts_app/product/data/datasources/products_remote_data_source.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/products.dart';
import 'package:clean_architecture_posts_app/product/domain/repositories/products_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<String>>> getAllCategories() async {
    // if (await networkInfo.isConnected) {
    try {
      final categories = await remoteDataSource.getAllCategories();
      return Right(categories);
    } on ServerException {
      return Left(ServerFailure());
    }
    // } else {

    // }
  }

  @override
  Future<Either<Failure, Products>> getAllProductsByCategory(
      {required String category}) async {
    try {
      final categories =
          await remoteDataSource.getAllProductsByCategory(category: category);
      return Right(categories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById({required int id}) async {
    try {
      final product = await remoteDataSource.getProductById(id: id);
      return Right(product);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
