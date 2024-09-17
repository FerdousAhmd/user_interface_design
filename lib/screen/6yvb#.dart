 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  bool _inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
      ),
    );
  }
  Widget _buildNewProductForm(){
    return Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameTEController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  labelText: 'Product Name'
                ),
              ),
              TextFormField(
                controller: _codeTEController,
                decoration: InputDecoration(
              hintText: 'Code',
              labelText: 'Product Code'
              ),
                validator: (String? value){
                  if(value == null )
                },
                ),
              TextFormField(
                controller: _imageTEController,
                  decoration: InputDecoration(
                      hintText: 'Image',
                      labelText: 'Product image'
                  )
              ),
              TextFormField(
                controller: _unitPriceTEController,
              decoration: InputDecoration(
              hintText: 'Price',
              labelText: 'Unit Price'
              )
              ),
              TextFormField(
                controller: _quantityTEController,
                  decoration: InputDecoration(
                      hintText: 'Quantity',
                      labelText: 'Quantity'
                  )
              ),
              TextFormField(
                controller: _totalPriceTEController,
              decoration: InputDecoration(
              hintText: 'Total Price',
              labelText: 'Total Price'
              )
              ),
              SizedBox(height: 16,),

              ElevatedButton(
                  child: Text(
                    'Add Product',),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                    ),
                onPressed: _onTapAddProductButton,

                  ),
            ],
          ),
        );
  }
  void _onTapAddProductButton(){
    if(_formkey.currentState!.validate()){
    addNewProduct();
    }
  }
  Future<void> addNewProduct() async{
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBodybody =  {
        "Img":_imageTEController.text,
        "ProductCode":_codeTEController.text,
        "ProductName":_nameTEController.text,
        "Qty":_quantityTEController.text,
        "TotalPrice":_totalPriceTEController.text,
        "UnitPrice":_unitPriceTEController.text,
    };
        Response response = await const post(uri,
          header:{
            "Content-type": "application/json"
          },
          body: jsonEncode(requestBody)
    );

    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){

    }
    _inProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    _unitPriceTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    super.dispose();
  }
}
