import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts_app/core/error/error_message.dart';
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/product/domain/usecases/get_all_categories_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetAllCategoriesUseCase categoriesUseCase;
  CategoriesBloc({required this.categoriesUseCase})
      : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetAllCategoriesEvent) {
        emit(LoadingCategoriesState());

        final failureOrPosts = await categoriesUseCase();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshCategoriesEvent) {
        emit(LoadingCategoriesState());

        final failureOrPosts = await categoriesUseCase();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  CategoriesState _mapFailureOrPostsToState(
      Either<Failure, List<String>> either) {
    return either.fold(
      (failure) => ErrorCategoriesState(message: mapFailureToMessage(failure)),
      (categories) => LoadedCategoriesState(
        categories: categories,
      ),
    );
  }
}
