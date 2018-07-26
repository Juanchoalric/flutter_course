import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    return new AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;

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
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[ 
          TextField(
            decoration: InputDecoration(labelText: "Email", ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (String value) {
              _emailValue = value;
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Password", ),
            obscureText: true,
            onChanged: (String value) {
              _passwordValue = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
          child: Text('LOGIN'),
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: () {
            print(_emailValue);
            print(_passwordValue);
            Navigator.pushReplacementNamed(context, "/home");
          },
        ),
        ],
      ),
    );
  }
}