import 'package:flutter/material.dart';
import 'package:user_interface_design/screen/product_list.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   home: ProductList(

   ),
    );
  }
}