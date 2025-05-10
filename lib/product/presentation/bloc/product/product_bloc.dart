import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts_app/core/error/error_message.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_product_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByIdUseCase getProductUseCase;
  ProductBloc({required this.getProductUseCase}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductEvent) {
        emit(LoadingProductState());

        final failureOrPosts = await getProductUseCase(id: event.id);
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshProductEvent) {
        emit(LoadingProductState());

        final failureOrPosts = await getProductUseCase(id: event.id);
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  ProductState _mapFailureOrPostsToState(Either<Failure, Product> either) {
    return either.fold(
      (failure) => ErrorProductState(message: mapFailureToMessage(failure)),
      (product) => LoadedProductState(
        product: product,
      ),
    );
  }
}
