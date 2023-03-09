import 'package:flutter/material.dart';

import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildproductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () => Navigator.pushNamed<bool>(
                              context, '/product/' + index.toString())
                          .then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      }),
                  child: Text('Details'))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildproductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Center(
        child: Text('No products found, please add some.'),
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
