import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {

  final Function addProducts;
  final Function deleteProducts;

  AuthPage({this.addProducts, this.deleteProducts});

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
              title: Text("All Products"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('LOGIN'),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
      ),
    );
  }
}