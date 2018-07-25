import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {

  final Function addProducts;
  final Function deleteProducts;

  ProductCreatePage({this.addProducts, this.deleteProducts});

  @override
  ProductCreatePageState createState() {
    return ProductCreatePageState();
  }
}

class ProductCreatePageState extends State<ProductCreatePage> {

  String titleValue = '';
  String descriptionValue = '';
  double priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
          child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Product title'),
            onChanged: (String value) {
              setState(() {
                            titleValue = value;
                          });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            maxLines: 4,
            onChanged: (String value) {
              descriptionValue = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              priceValue = double.parse(value);
            },
          ),
          RaisedButton(
            child: Text('SAVE'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title' : titleValue,
                'description' : descriptionValue,
                'price' : priceValue,
                'imageUrl' : 'assets/food.jpg'
              };
              widget.addProducts(product);
            },
          )
        ],
      ),
    );
  }
}