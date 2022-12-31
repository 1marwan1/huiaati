import 'dart:async';
import '../../data/repostry/markart_google_map.dart';
import '../../domain/repostry/polyline_points_google_map_domain.dart';
import '/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class GoogleMapWidget extends StatelessWidget {
  GoogleMapWidget(
      {Key? key,
      required this.polylinePointsGoogleMap,
      required this.googleMapController,
      required this.kGooglePlex,
      required this.markerGoogleMap})
      : super(key: key);
  final Completer<GoogleMapController> _controller = Completer();
  PolylinePointsGoogleMap? polylinePointsGoogleMap;
  final CameraPosition? kGooglePlex;
  GoogleMapController? googleMapController;
  final MarkerGoogleMapImp? markerGoogleMap;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: markerGoogleMap!.marker,
      initialCameraPosition: kGooglePlex!,
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
        markerGoogleMap!.googleMapController = controller;
        _controller.complete(controller);
      },
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      polylines: drowGooglePolyline(),
      // polylines: Set<Polyline>.of(polylinePointsGoogleMap!.polylines.values),
      // polygons: drowGooglePolygon(),
      onTap: (latLong) async {},
    );
  }
  //? ================================================
  //! Drow in Googel Map    Shap==> Polyline
  //? ================================================

  Set<Polyline> drowGooglePolyline() {
    List<LatLng> polygonCoords = [];
    List<LatLng> polygonCoordsAdd = [];
    for (var marker in markerGoogleMap!.marker) {
      polygonCoordsAdd.add(marker.position);
    }
    if (polygonCoordsAdd.isNotEmpty && polygonCoordsAdd.length > 1) {
      polygonCoords.add(polygonCoordsAdd[0]);
      polygonCoords.add(polygonCoordsAdd[polygonCoordsAdd.length - 1]);
    }

    Set<Polyline> polylineSet = {};
    polylineSet.add(Polyline(
        polylineId: const PolylineId('drowPolyline'),
        points: polygonCoords,
        width: 1,
        color: kprimeryColor));

    return polylineSet;
  }
  //? ================================================
  //! Drow in Googel Map    Shap==> Polygon
  //? ================================================

  Set<Polygon> drowGooglePolygon() {
    List<LatLng> polygonCoords = [];
    List<LatLng> polygonCoordsAdd = [];
    for (var marker in markerGoogleMap!.marker) {
      polygonCoordsAdd.add(marker.position);
    }
    if (polygonCoordsAdd.isNotEmpty && polygonCoordsAdd.length > 1) {
      polygonCoords.add(polygonCoordsAdd[0]);
      polygonCoords.add(polygonCoordsAdd[polygonCoordsAdd.length - 1]);
    }

    Set<Polygon> polygonSet = {};
    polygonSet.add(Polygon(
        polygonId: const PolygonId('drowPolygon'),
        points: polygonCoords,
        strokeColor: kprimeryColor));

    return polygonSet;
  }
}
