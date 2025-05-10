part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}


class GetAllProductsEvent extends ProductsEvent {
  final String category;

  const GetAllProductsEvent({required this.category});
}

class RefreshProductsEvent extends ProductsEvent {
  final String category;

  const RefreshProductsEvent({required this.category});
}