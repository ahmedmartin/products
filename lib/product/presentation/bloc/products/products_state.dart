part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}


class LoadingProductsState extends ProductsState {}

class LoadedProductsState extends ProductsState {
  final Products products;

  const LoadedProductsState({required this.products});

}

class ErrorProductsState extends ProductsState {
  final String message;

  const ErrorProductsState({required this.message});

  @override
  List<Object> get props => [message];
}