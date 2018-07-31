import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './products_card.dart';
import '../../models/product.dart';
import '../../scoped_models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) => ProductCard(
              products: products[index],
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
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
