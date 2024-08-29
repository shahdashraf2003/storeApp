// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/pages/update_product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productsModel});
  ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id, arguments: productsModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 71, 71, 71).withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: .5,
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productsModel.title.substring(0, 7),
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${productsModel.price}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 15,
            child: Image.network(
              productsModel.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
