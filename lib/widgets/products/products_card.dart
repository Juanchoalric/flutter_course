import 'package:flutter/material.dart';

import './price_tag.dart';
import './adress_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  final int productIndex;
  ProductCard({this.products, this.productIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products.image),
          Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products.title,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Oswald"),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  PriceTag(price: products.price.toString()),
                ],
              )),
          AdressTag(
            adress: 'Union Square, San Francisco',
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + productIndex.toString()),
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                ),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
