
import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/products.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failure, Products>> getAllProductsByCategory({required String category});
  
  Future<Either<Failure, List<String>>> getAllCategories();
  
  Future<Either<Failure, Product>> getProductById({required int id});

}
