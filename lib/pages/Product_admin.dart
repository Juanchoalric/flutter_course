import 'package:flutter/material.dart';

import './product_create.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {

  final Function addProducts;
  final Function deleteProducts;

  ProductAdminPage({this.addProducts, this.deleteProducts});

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
              ProductCreatePage(addProducts: addProducts),
              ProductListPage(),
          ],
        )
      ),
    );
  }
}