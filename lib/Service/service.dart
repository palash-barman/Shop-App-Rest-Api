import 'package:http/http.dart' as http;
import 'package:shop_app_rest_api/Models/product_models.dart';

class ApiService{

 static Future<List<Products>?> getProduct ()async{
  var response=await http.get(Uri.parse("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
  if(response.statusCode==200){
    return productsFromJson(response.body);
  }
  print(response.body);
}


}