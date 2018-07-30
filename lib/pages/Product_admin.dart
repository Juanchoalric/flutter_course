import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {

  final Function addProducts;
  final Function deleteProducts;
  final List<Map<String, dynamic>> products;

  ProductAdminPage({this.addProducts, this.deleteProducts, this.products});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: "Create Products",),
              Tab(
                icon: Icon(Icons.list),
                text: "My Products",),
            ],
          ),
          title: Text("My Products"),
        ),
        body: TabBarView(
          children: <Widget>[
              ProductEditPage(addProducts: addProducts),
              ProductListPage(products: products,),
          ],
        )
      ),
    );
  }
}