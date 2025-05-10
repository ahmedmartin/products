part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}


class LoadingCategoriesState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState {
  final List<String> categories;

  const LoadedCategoriesState({required this.categories});
}

class ErrorCategoriesState extends CategoriesState {
  final String message;

  const ErrorCategoriesState({required this.message});
}