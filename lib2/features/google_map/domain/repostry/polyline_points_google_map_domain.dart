import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
abstract class PolylinePointsGoogleMap {
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyDrpmwkpRX_sEtGZKFQevi065A0hh134y4";
  addPolyLine();
  getPolyline(
      {required LatLng latLngLocationMe,
      required LatLng latLngLocationCustmer});
}
