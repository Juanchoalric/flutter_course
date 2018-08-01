import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {

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
              ProductEditPage(),
              ProductListPage(),
          ],
        )
      ),
    );
  }
}