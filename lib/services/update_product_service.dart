// ignore_for_file: avoid_print

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';

class UpdateProductService {
  Future<ProductsModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String category,
    required int id,
    required String image,
  }) async {
    print('product id= $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      },
      token: '',
    );

    return ProductsModel.fromJson(data);
  }
}
