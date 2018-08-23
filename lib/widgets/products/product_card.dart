import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/product.dart';
import '../../scoped_models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  Widget _buildTitlePriceAndFavoriteRow(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          child: ListTile(
            title: TitleDefault(product.title),
            subtitle: PriceTag(product.price.toString()),
            trailing: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              iconSize: 25.0,
              onPressed: () {
                model.selectProduct(product.id);
                model.toggleProductFavoriteStatus();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Container(
        color: Colors.black12,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: GestureDetector(
          onTap: () {
            model.selectProduct(product.id);
            Navigator
                .pushNamed<bool>(context, '/product/' + product.id)
                .then((_) => model.selectProduct(null));
          },
          child: Card(
            elevation: 6.0,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: product.id,
                  child: FadeInImage(
                    width: 1000.0,
                    image: NetworkImage(product.image),
                    height: 150.0,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/purple.jpg'),
                  ),
                ),
                _buildTitlePriceAndFavoriteRow(context),
              ],
            ),
          ),
        ),
      );
    });
  }
}
