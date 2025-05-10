import 'package:clean_architecture_posts_app/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class Products extends Equatable{
  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int? total;
  final int? skip;
  final int? limit;
  
  @override
  List<Object?> get props => [products,total,skip,limit];
}
