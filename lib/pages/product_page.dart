import 'package:flutter/material.dart';

import '../widgets/products/products.dart';

class ProductsPage extends StatelessWidget {

  final List<Map<String, dynamic>> products;

  ProductsPage({this.products,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Manage Product"),
              onTap: () {
                Navigator.pushNamed(context, '/admin');
              },
              
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("EasyList"),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.favorite),),
        ],
      ),
      body: Products(products: products),
    );
  }
}
