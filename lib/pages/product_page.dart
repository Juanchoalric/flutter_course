import 'package:flutter/material.dart';

import '../product_manager.dart';
import './Product_admin.dart';

class ProductPage extends StatelessWidget {
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
              title: Text("Manage Product"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductAdminPage()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("EasyList"),
      ),
      body: ProductManager(),
    );
  }
}
