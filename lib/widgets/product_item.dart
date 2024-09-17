import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
      ),
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Price: \$ ${product.unitPrice}' ),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price: \$ ${product.totalPrice}' ),
          Divider(),
          ButtonBar(
              children:[
                TextButton.icon(
                  onPressed: () {},
                  icon:Icon(Icons.edit),
                  label: Text('Edit'),),

                TextButton.icon(
                  onPressed: () {},
                  icon:Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  label: Text('Delete',
                    style: TextStyle(
                        color: Colors.red),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}