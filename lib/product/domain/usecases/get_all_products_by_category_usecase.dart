

import 'package:clean_architecture_posts_app/product/domain/entities/products.dart';
import 'package:clean_architecture_posts_app/product/domain/repositories/products_repository.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetAllProductsByCategoryUseCase {
  final ProductsRepository repository;

  GetAllProductsByCategoryUseCase(this.repository);

  Future<Either<Failure, Products>> call({required String category}) async {
    return await repository.getAllProductsByCategory(category: category);
  }
}