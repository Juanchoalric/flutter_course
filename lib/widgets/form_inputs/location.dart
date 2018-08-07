import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  final FocusNode _addressInputFocusNode = FocusNode();
  Uri _staticMapUri;

  @override
  void initState() {
    _addressInputFocusNode.addListener(_updateLocation);
    getStaticMap();
    super.initState();
  }

  @override
  void dispose() {
    _addressInputFocusNode.removeListener(_updateLocation);
    super.dispose();
  }

  getStaticMap() {
    final StaticMapProvider staticMapProvider =
        StaticMapProvider('AIzaSyBC_LyGAwFzWiT7GqSKMfg3_H6o-g94pLY');
    final Uri staticMapUri = staticMapProvider.getStaticUriWithMarkers(
        [Marker('position', 'Position', 41.40338, 2.17403)],
        center: Location(41.40338, 2.17403),
        width: 300,
        height: 300,
        maptype: StaticMapViewType.roadmap);
        setState(() {
                  _staticMapUri = staticMapUri;
                });
  }

  void _updateLocation() {}

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextFormField(
        focusNode: _addressInputFocusNode,
      ),
      SizedBox(
        height: 10.0,
      ),
      Image.network(_staticMapUri.toString()),
    ]);
  }
}
