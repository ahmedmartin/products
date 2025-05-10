import 'package:clean_architecture_posts_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts_app/core/widgets/message_display_widget.dart';
import 'package:clean_architecture_posts_app/product/presentation/bloc/categories/categories_bloc.dart';
import 'package:clean_architecture_posts_app/product/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return const LoadingWidget();
          } else if (state is LoadedCategoriesState) {
            return ListView.separated(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.categories[index]),
                onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductsPage(category: state.categories[index]),
              ),
            );
                },);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else if (state is ErrorCategoriesState) {
            return MessageDisplayWidget(
              message: state.message,
              onRetry: () {
                _onRefresh(context);
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CategoriesBloc>(context)
        .add(const RefreshCategoriesEvent());
  }
}
