import 'package:clean_architecture_posts_app/product/data/models/product_model.dart';
import 'package:clean_architecture_posts_app/product/domain/entities/products.dart';

class ProductsModel extends Products{
  ProductsModel({
    required products,
    required total,
    required skip,
    required limit,
  }) : super(products: products, total: total, skip: skip, limit: limit);


  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
              json["products"]!.map((x) => ProductModel.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }
}
