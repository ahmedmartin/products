
import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';
import 'package:clean_architecture_posts_app/product/domain/repositories/products_repository.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetProductByIdUseCase {
  final ProductsRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Either<Failure, Product>> call({required int id}) async {
    return await repository.getProductById(id: id);
  }
}