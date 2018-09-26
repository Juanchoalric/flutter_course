import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:scoped_model/scoped_model.dart';
import 'package:map_view/map_view.dart';
import 'package:firebase_admob/firebase_admob.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/product_page.dart';
import './pages/product.dart';
import './scoped_models/main.dart';
import './models/product.dart';
import './widgets/helpers/custom_route.dart';
import './globals/global_config.dart';
import './globals/ads.dart';
import './globals/adaptive_theme.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  MapView.setApiKey(apiKey);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();
  final _platformChannel = MethodChannel('flutter-course.com/battery');
  bool _isAuthenticated = false;

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await _platformChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level is $result %.';
    } catch (error) {
      batteryLevel = ' Failed to get battery level';
    }
    print(batteryLevel);
  }

  @override
  void initState() {
    _model.autoAuthenticate();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });
    _getBatteryLevel();
    FirebaseAdMob.instance.initialize(appId: apiKeyAdMob);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kioto',
        // debugShowMaterialGrid: true,
        theme: getAdaptiveThemeData(context),
        // home: AuthPage(),
        builder: (BuildContext context, Widget child) {
          myBanner
            // typically this happens well before the ad is shown
            ..load()
            ..show(
              // Positions the banner ad 60 pixels from the bottom of the screen
              anchorOffset: 0.0,
              // Banner Position
              anchorType: AnchorType.bottom,
            );

            var mediaQuery = MediaQuery.of(context);
            double paddingBottom = 50.0;
            if(mediaQuery.orientation == Orientation.landscape){
              paddingBottom = 50.0;
            }
            return Padding(
              child: child,
              padding: EdgeInsets.only(bottom: paddingBottom),
              );
        },
        routes: {
          '/': (BuildContext context) =>
              !_isAuthenticated ? AuthPage() : ProductsPage(_model),
          '/admin': (BuildContext context) =>
              !_isAuthenticated ? AuthPage() : ProductsAdminPage(_model),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (!_isAuthenticated) {
            return CustomRoute<bool>(
              builder: (BuildContext context) => AuthPage(),
            );
          }
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product =
                _model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  !_isAuthenticated ? AuthPage() : ProductPage(product),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage(_model));
        },
      ),
    );
  }
}
