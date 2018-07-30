import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

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
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 4,
      onChanged: (String value) {
        _descriptionValue = value;
      },
    );
  }

  Widget _buildPriceDoubleField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        _priceValue = double.parse(value);
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'imageUrl': 'assets/food.jpg'
    };
    widget.addProducts(product);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceDoubleField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            textColor: Colors.white,
            child: Text('SAVE'),
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }
}
