part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final Product product;

  const LoadedProductState({required this.product});

}

class ErrorProductState extends ProductState {
  final String message;

  const ErrorProductState({required this.message});

  @override
  List<Object> get props => [message];
}