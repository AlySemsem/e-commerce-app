import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'images/11.1 food.jpg.jpg'});
      },
      child: Text('Add Product'),
    );
  }
}
