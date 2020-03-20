import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import 'dart:developer';
import '../helper/locations.dart' as locations;

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
//  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPIKey = DotEnv().env['GOOGLE_MAP_KEY'];
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }
  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        "assets/pin/driving_pin.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        "assets/pin/destination_map_marker.png");
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setMapPins();
    setPolylines();
  }

  void setMapPins() {
    setState(() {
      Marker source = Marker(
          markerId: MarkerId("sourcePin"),
          position: SOURCE_LOCATION,
          icon: sourceIcon
      );
      Marker dest = Marker(
          markerId: MarkerId("destPin"),
          position: DEST_LOCATION,
          icon: destinationIcon
      );

      _markers["sourcePin"] = source;
      _markers["destPin"] = dest;
    });
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
      googleAPIKey,
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude,
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude
    );

    if (result.isNotEmpty) {
      log('data: $result');
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates
      );

      _polylines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: SOURCE_LOCATION
    );
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      tiltGesturesEnabled: false,
      markers: _markers.values.toSet(),
      polylines: _polylines,
      mapType: MapType.normal,
      initialCameraPosition: initialLocation,
      onMapCreated: onMapCreated
    );
  }
}