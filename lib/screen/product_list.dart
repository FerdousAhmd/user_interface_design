import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:user_interface_design/screen/add_new_product_screen.dart';
import 'package:user_interface_design/screen/update_product.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, });

  // final Product product;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductList'),
        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: _inProgress ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16,);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return const UpdateNewProductScreen(productId: 'ProductId', );
                }
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for(var item in jsonResponse['data']){
        Product product = Product(id: item['_id'] ?? '',
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            productImage: item['Img'] ?? '',
            quantity: item['UnitPrice'] ?? '',
            unitPrice: item['Qty'] ?? '',
            totalPrice: item['TotalPrice'] ?? '',
            CreateAt: item['CreateDate'] ?? '');
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}

