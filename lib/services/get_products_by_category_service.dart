
import 'package:store_app/constants.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/models/products_model.dart';

class GetProductsByCategory {
  Future<List<ProductsModel>> getProductsByCategory(String categoryName) async {
    List<dynamic> data = await Api()
        .get(url: '${Constants.baseUrl}/products/category/$categoryName', token: '');
    List<ProductsModel> allProductsByCategory = [];
    for (int i = 0; i < data.length; i++) {
      ProductsModel productsModel = ProductsModel.fromJson(data[i]);
      allProductsByCategory.add(productsModel);
    }
    return allProductsByCategory;
  }
}
