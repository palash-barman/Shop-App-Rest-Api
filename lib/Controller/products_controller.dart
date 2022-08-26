

import 'package:get/get.dart';
import 'package:shop_app_rest_api/Models/product_models.dart';
import 'package:shop_app_rest_api/Service/service.dart';

class ProductController extends GetxController{

  var productList=<Products>[].obs;
  var isLoading=true.obs;
  var isFavorite=false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProduct();
    super.onInit();
  }

  void fetchProduct()async{
    try{
      isLoading.value=true;
      var product=await ApiService.getProduct();
    if(product!=null){
      productList.value=product;
      print(product);
    }
  }finally{
    isLoading.value=false;
    print("error : ");
  }
    
    }



}