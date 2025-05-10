import 'package:clean_architecture_posts_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts_app/core/widgets/message_display_widget.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  final int id;

  const ProductDetailsPage({super.key, required this.id});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductState) {
            return const LoadingWidget();
          } else if (state is LoadedProductState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(state.product.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.product.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          width: 150,
                          child: Image.network(state.product.images[index],
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const LoadingWidget();
                          }),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const VerticalDivider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('description',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(state.product.description),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ListTile(
                          title: const Text('price',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(state.product.price.toString()),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ListTile(
                          title: const Text('quantity',
                              style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              state.product.minimumOrderQuantity.toString()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('rate',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(state.product.rating.toString()),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('SKU',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(state.product.sku),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const Text('tags',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: SizedBox(
                      height: 20,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.product.tags.length,
                          itemBuilder: (context, index) => Text(
                                state.product.tags[index],
                                style: const TextStyle(color: Colors.blue),
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                width: 10,
                              )),
                    ),
                  ),
                  ListTile(
                    title: const Text('reviews',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.product.reviews.length,
                        itemBuilder: (context, index) => SizedBox(
                            width: 260,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Text(
                                state.product.reviews[index].reviewerEmail,
                                style:
                                    const TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              subtitle: Text(
                                  state.product.reviews[index].comment,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            )),
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ErrorProductState) {
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
    BlocProvider.of<ProductBloc>(context)
        .add(RefreshProductEvent(id: widget.id));
  }
}
