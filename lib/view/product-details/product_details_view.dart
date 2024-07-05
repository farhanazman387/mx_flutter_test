import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:product_showcase/models/product_list_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productDets});

  final Product productDets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(productDets.title ?? "")),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                // PhotoView(
                //   imageProvider: NetworkImage(productDets.image ?? ""),
                //   minScale: PhotoViewComputedScale.contained * 0.8,
                //   maxScale: PhotoViewComputedScale.covered * 2,
                //   initialScale: PhotoViewComputedScale.contained,
                //   backgroundDecoration: const BoxDecoration(
                //     color: Colors.black,
                //   ),
                // ),
                Image(
                  image: NetworkImage(productDets.image ?? ""),
                ),
                Text(
                  "RM ${productDets.price ?? 0.0}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Rating: ${productDets.rating?.rate}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  productDets.description ?? "",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ));
  }
}
