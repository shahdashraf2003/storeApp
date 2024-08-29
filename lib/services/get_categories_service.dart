
import 'package:store_app/constants.dart';
import 'package:store_app/helper/Api.dart';


class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    
  List<dynamic> data = await Api().get(url:'${Constants.baseUrl}/products/categories', token: '');
  
  return data;

  }
}
