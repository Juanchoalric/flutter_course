import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/Product_admin.dart';
import './pages/product_page.dart';
import './pages/product.dart';
import './scoped_models/products.dart';

void main(){
  //debugPaintSizeEnabled = true;
  //debugPaintPointersEnabled = true;
runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
          child: MaterialApp(
        //debugShowMaterialGrid: true,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple,
        ),
        //home: AuthPage(),
        routes: {
          '/': (BuildContext context) => AuthPage(),
          '/home': (BuildContext context) => ProductsPage(),
          '/admin' : (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if(pathElements[0] != ''){
            return null;
          }
          if(pathElements[1] == 'product'){
            final int index = int.parse(pathElements[2]);
         return MaterialPageRoute<bool>(
                    builder: (BuildContext context) => ProductPage(index: index,));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage()
          );
        },
      ),
    );
  }
}
