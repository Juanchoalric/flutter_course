import 'dart:async';

import 'package:flutter/material.dart';

import 'package:map_view/map_view.dart';

import '../widgets/products/product_fab.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  void _showMap() {
    final List<Marker> markers = <Marker>[
      Marker('position', 'Position', product.location.latitude,
          product.location.longitude)
    ];
    final cameraPosition = CameraPosition(
        Location(product.location.latitude, product.location.longitude), 14.0);
    final mapView = MapView();
    mapView.show(
        MapOptions(
            initialCameraPosition: cameraPosition,
            mapViewType: MapViewType.normal,
            title: 'Product Location'),
        toolbarActions: [
          ToolbarAction('Close', 1),
        ]);
    mapView.onToolbarAction.listen((int id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
    mapView.onMapReady.listen((_) {
      mapView.setMarkers(markers);
    });
  }

  Widget _buildAddressPriceRow(String address, double price) {

    var splitLocation = address.split(",");


    return Container(
        child: Text(
          splitLocation[0],
          style: TextStyle(fontFamily: 'Oswald', color: Colors.black87),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(product.title),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(product.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Oswald', fontSize: 23.0),),
                background: Hero(
                  tag: product.id,
                  child: FadeInImage(
                    image: NetworkImage(product.image),
                    height: 300.0,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/food.jpg'),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    child: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Oswald', fontSize: 23.0),),
                  ),
                  GestureDetector(
                    onTap: _showMap,
                                      child: Container(
                      color: Colors.deepPurple,
                                        child: ListTile(
                        title: _buildAddressPriceRow(
                            product.location.address, product.price),
                            subtitle: Text("Show Map", style: TextStyle(color: Colors.white),),
                        trailing: Text(
          '\$' + product.price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.white, fontSize: 20.0),
        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 60.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      product.description,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: ProductFab(product),
      ),
    );
  }
}
