import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/products.dart';
import '../models/product.dart';
class ProductPage extends StatelessWidget {

  final int index;

  ProductPage({this.index});

  // void _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Are you sure?'),
  //           content: Text('This action cannot be undone!'),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('CANCEL'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text('CONTINUE'),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 Navigator.pop(context, true);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>( builder: (BuildContext context, Widget child, ProductsModel model ) {
        
        final Product products = model.products[index];

        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.favorite),
                onPressed: () {},
              )
            ],
            title: Text(products.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(products.image),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(products.title, style: TextStyle(fontSize: 30.0, fontFamily: 'Oswald'),),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Theme.of(context).accentColor),
                      child: Text(
                        '\$${products.price.toString()}',
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  child : Text('Union Square, San Francisco', style: TextStyle(color: Colors.grey, fontSize: 20.0),),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(products.description, style: TextStyle(fontSize: 15.0, color: Colors.grey),),
                ),
              ],
            ),
          ));
      },) 
    );
  }
}
