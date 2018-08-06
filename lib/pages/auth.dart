import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    return new AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email' : null,
    'password' : null,
    'acceptTerms' : false,
  };
  // String _emailValue;
  // String _passwordValue;
  // bool _acceptTerms = false;

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(.5), BlendMode.dstATop),
        image: AssetImage("assets/background.jpg"));
  }

  Widget _builEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email", filled: true, fillColor: Colors.white),
      validator: (String value){
        if(value.isEmpty || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)){
          return 'The email must not be empty and have to have a valid form';
        }
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
          _formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Password", filled: true, fillColor: Colors.white),
      validator: (String value) {
        if(value.isEmpty || value.length < 6){
          return 'Password must not be empty and have +6 length';
        }
      },
      obscureText: true,
      onSaved: (String value) {
          _formData['password'] = value;
      },
    );
  }

  Widget _buildSwitchTileField(bool value) {
    return SwitchListTile(
                  title: Text("Accept terms and services"),
                  onChanged: (bool value) {
                    setState(() {
                    _formData['acceptTerms'] = value;
                    });
                  },
                  value: _formData['acceptTerms'],
                );
  }

  void _submitForm(Function login) {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return;
    }
    _formKey.currentState.save();
    login(_formData['email'], _formData['password']);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
   
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        child: Form(
          key: _formKey,
                  child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                            child: Column(
                  children: <Widget>[
                    _builEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    _buildSwitchTileField(_formData['acceptTerms']),
                    SizedBox(
                      height: 10.0,
                    ),
                    ScopedModelDescendant(builder: (BuildContext context, Widget child, MainModel model) {
                      return RaisedButton(
                      child: Text('LOGIN'),
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () => _submitForm(model.login),
                    );
                    },) 
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
