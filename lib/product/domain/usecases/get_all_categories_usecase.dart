

import 'package:clean_architecture_posts_app/product/domain/repositories/products_repository.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriesUseCase {
  final ProductsRepository repository;

  GetAllCategoriesUseCase(this.repository);

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getAllCategories();
  }
}