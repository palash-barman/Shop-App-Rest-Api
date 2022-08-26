import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app_rest_api/View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),

    );
    
  }
}