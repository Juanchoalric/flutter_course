import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped_models/products.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProducts;
  final Function upgradeProducts;
  final Product product;
  final int index;
  ProductEditPage(
      {this.addProducts, this.upgradeProducts, this.product, this.index});

  @override
  ProductEditPageState createState() {
    return ProductEditPageState();
  }
}

class ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'imageUrl': 'assets/food.jpg',
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product title'),
      initialValue: widget.product == null ? '' : widget.product.title,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long.';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      initialValue: widget.product == null ? '' : widget.product.description,
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long.';
        }
      },
      maxLines: 4,
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceDoubleField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      initialValue:
          widget.product == null ? '' : widget.product.price.toString(),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm(Function addProducts, Function updateProducts) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    ;
    _formKey.currentState.save();
    if (widget.product == null) {
      addProducts(Product(
          title: _formData['title'],
          description: _formData['description'],
          image: _formData['imageUrl'],
          price: _formData['price']));
    } else {
      updateProducts(
          widget.index,
          Product(
              title: _formData['title'],
              description: _formData['description'],
              image: _formData['imageUrl'],
              price: _formData['price']));
    }

    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return RaisedButton(
          textColor: Colors.white,
          child: Text('SAVE'),
          onPressed: () => _submitForm(model.addProduct, model.updateProduct ),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(),
              _buildDescriptionTextField(),
              _buildPriceDoubleField(),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
              // GestureDetector(
              //   onTap: _submitForm,
              //             child: Container(
              //     padding: EdgeInsets.all(5.0),
              //     color: Colors.green,
              //     child: Text("My Button"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
