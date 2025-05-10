import 'package:clean_architecture_posts_app/product/data/models/product_model.dart';
import 'package:clean_architecture_posts_app/product/data/models/products_model.dart';
import 'package:clean_architecture_posts_app/core/strings/api_urls.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';

abstract class ProductsRemoteDataSource {
  Future<List<String>> getAllCategories();
  Future<ProductsModel> getAllProductsByCategory({required String category});
  Future<ProductModel> getProductById({required int id});
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio client;

  ProductsRemoteDataSourceImpl({required this.client});
  @override
  Future<ProductsModel> getAllProductsByCategory(
      {required String category}) async {
    final response = await client.get(AllProductsByCategoryURL(category));
    try{
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }}catch(e){
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getAllCategories() async {
    try{
      final response = await client.get(CategoriesURL);
    if (response.statusCode == 200) {
      List list = response.data;
      return list.cast<String>();
    } else {
      throw ServerException();
    }
    }catch(e){
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProductById({required int id}) async {
    try{
      final response = await client.get(ProductByIdURL(id));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
    }catch(e){
      throw ServerException();
    }
  }
}
