//Main view for product list view
import 'package:flutter/material.dart';
import 'package:product_showcase/models/product_list_model.dart';
import 'package:product_showcase/view/product_list/component/list_card.dart';
import 'package:product_showcase/view/product_list/product_list_viewModel.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.title});

  final String title;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Consumer<ProductListViewModel>(builder: (context, viewModel, child) {
        if (!viewModel.fetchingData && viewModel.products.isEmpty) {
          Provider.of<ProductListViewModel>(context, listen: false)
              .fetchProducts();
        }
        if (viewModel.fetchingData) {
          // While data is being fetched
          return const LinearProgressIndicator();
        } else {
          // If data is successfully fetched
          List<Product> products = viewModel.products;
          return Column(
            children: [
              Flexible(
                  child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListCard(productlist: products[index],);
                },
              ))
            ],
          );
        }
      }),
    );
  }
}