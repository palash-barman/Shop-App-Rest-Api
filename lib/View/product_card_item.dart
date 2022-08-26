
import 'package:flutter/material.dart';

import '../Models/product_models.dart';

class ProductCardItem extends StatelessWidget {
  ProductCardItem({Key? key,required this.products}) : super(key: key);
  Products products;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height:height*0.17,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Image.network(products.imageLink,fit: BoxFit.fill,),
                ),
                Positioned(
                    right: 0,
                    child: Card(
                        elevation:5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(width*0.05))),
                        child: Padding(
                          padding: EdgeInsets.all(width*0.01),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ))),
              ],
            ),
             SizedBox(
              height:height*0.01,
            ),
            Text(
              products.name,
              style: TextStyle(
                  fontSize:width*0.04,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
              maxLines: 2,
            ),
             SizedBox(
              height:height*0.01,
            ),
            Container(
              height:height*0.03,
              width:width*0.15,
              padding: EdgeInsets.all(width*0.001),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(width*0.02),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      products.rating
                          .toString(),
                      style:TextStyle(
                          fontSize:width*0.05, color: Colors.white,overflow: TextOverflow.ellipsis),
                    ),
                     Icon(
                      Icons.star,
                      color: Colors.white,
                      size:width*0.05,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height:height*0.01),
            Text(
                "\$${products.price}",
                style: TextStyle(
                  fontSize:width*0.06,
                  fontWeight: FontWeight.w700
                )),
          ],
        ),
      ),
    );
  }
}
