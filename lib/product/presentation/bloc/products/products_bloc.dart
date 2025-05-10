import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts_app/core/error/error_message.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/products.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_all_products_by_category_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsByCategoryUseCase getAllProductsUseCase;
  ProductsBloc({required this.getAllProductsUseCase})
      : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(LoadingProductsState());

        final failureOrPosts =
            await getAllProductsUseCase(category: event.category);
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshProductsEvent) {
        emit(LoadingProductsState());

        final failureOrPosts =
            await getAllProductsUseCase(category: event.category);
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  ProductsState _mapFailureOrPostsToState(Either<Failure, Products> either) {
    return either.fold(
      (failure) => ErrorProductsState(message: mapFailureToMessage(failure)),
      (products) => LoadedProductsState(
        products: products,
      ),
    );
  }
}
