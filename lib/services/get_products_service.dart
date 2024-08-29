import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/constants.dart';

class GetAllProductsSrvice {
  Future<List<ProductsModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: '${Constants.baseUrl}/products', token: '');
    List<ProductsModel> allProducts = [];
    for (int i = 0; i < data.length; i++) {
      ProductsModel productsModel = ProductsModel.fromJson(data[i]);
      allProducts.add(productsModel);
    }
    return allProducts;
  }
}
