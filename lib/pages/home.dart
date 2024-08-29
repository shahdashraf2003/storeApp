import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_products_service.dart';
import 'package:store_app/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded)),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 60,
        ),
        child: FutureBuilder<List<ProductsModel>>(
          future: GetAllProductsSrvice().getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<ProductsModel> products = snapshot.data;
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) => ProductCard(
                  productsModel: products[index],
                ),
                itemCount: products.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
