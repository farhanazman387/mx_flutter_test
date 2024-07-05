//class for List Card
import 'package:flutter/material.dart';
import 'package:product_showcase/models/product_list_model.dart';
import 'package:product_showcase/view/product-details/product_details_view.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.productlist});

  final Product productlist;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsView(productDets: productlist)));
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: NetworkImage(productlist.image ?? ""),
                      height: 100,
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productlist.title ?? "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          // Padding(
                          //     padding: const EdgeInsets.only(top: 8),
                          //     child: Text(
                          //       productlist.description ?? "",
                          //       maxLines: 5,
                          //       style: const TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.w400),
                          //     )),
                              Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "RM ${productlist.price ?? 0.0}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}