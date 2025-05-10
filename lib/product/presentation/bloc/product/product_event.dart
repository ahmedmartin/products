part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class GetProductEvent extends ProductEvent {
  final int id;

  const GetProductEvent({required this.id});
}

class RefreshProductEvent extends ProductEvent {
  final int id;

  const RefreshProductEvent({required this.id});
}