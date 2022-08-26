import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_app_rest_api/Controller/products_controller.dart';
import 'package:shop_app_rest_api/View/product_card_item.dart';

import '../Models/product_models.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0  ,
        toolbarHeight: kToolbarHeight,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.deepOrangeAccent,
                size:width*0.09,
              )),
          SizedBox(width:width*0.01,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            Row(
              children: [
                 Expanded(
                    child: Text(
                  "Shopping",
                  style: TextStyle(
                      fontSize:width*0.08,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.view_list_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.grid_view,
                      color: Colors.black,
                    )),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (_productController.isLoading.value) {
                  return  Center(
                    child: SizedBox(
                      height:width*0.1,
                      width:width*0.1,
                      child: const CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      itemCount: _productController.productList.length,
                      itemBuilder: (context, index) {
                        return ProductCardItem(products:_productController.productList[index],);
                      });
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
