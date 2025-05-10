import 'package:clean_architecture_posts_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts_app/core/widgets/message_display_widget.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/products/products_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  final String category;

  const ProductsPage({
    super.key,
    required this.category,
  });
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    
    BlocProvider.of<ProductsBloc>(context)
        .add(GetAllProductsEvent(category: widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is LoadingProductsState) {
            return const LoadingWidget();
          } else if (state is LoadedProductsState) {
            return ListView.separated(
              itemCount: state.products.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.products.products[index].title,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(state.products.products[index].thumbnail),
                  trailing: Text(state.products.products[index].price.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onTap: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsPage(id: state.products.products[index].id),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else if (state is ErrorProductsState) {
            return MessageDisplayWidget(
              message: state.message,
              onRetry: () {
                _onRefresh();
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<ProductsBloc>(context)
        .add(RefreshProductsEvent(category: widget.category));
  }
}
