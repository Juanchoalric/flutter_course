import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './products_card.dart';
import '../../models/product.dart';
import '../../scoped_models/main.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
              product: products[index],
              productIndex: index,
            ),
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text("No Products found, please add some"),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print("[Products Widget] build");
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
