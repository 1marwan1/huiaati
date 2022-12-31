import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/enam_and_extintion/enam_type_image_in_marker.dart';
import '../../domain/repostry/markart_google_map_domin.dart';

// ignore: must_be_immutable
class MarkerGoogleMapImp extends MarkerGoogleMap {
  MarkerGoogleMapImp();

  void listenchangeLocationMarker() {
    streamSubscription = Geolocator.getPositionStream().listen((position) {
      changeLocationMarker(
          latLng: LatLng(position.latitude, position.longitude), markerId: "1");
    });
  }

  @override
  Future<void> changeLocationMarker(
      {required String markerId, required LatLng latLng}) async {
    marker.remove(Marker(markerId: MarkerId(markerId)));
    marker.add(await _addNewMarker(markerId: markerId, latLng: latLng));
    await addNewMarker(markerId: markerId, latLng: latLng);
    await googleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
  }

  Future<Marker> _addNewMarker(
      {required String markerId,
      required LatLng latLng,
      TypeImageInMarker typeImageInMarker =
          TypeImageInMarker.ME_LOCATION}) async {
    await googleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
    return Marker(
      markerId: MarkerId(markerId),
      position: latLng,
      icon: await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty,
        typeImageInMarker.value(),
      ),
    );
  }

  @override
  Future<void> addNewMarker(
      {required String markerId,
      required LatLng latLng,
      TypeImageInMarker typeImageInMarker =
          TypeImageInMarker.ME_LOCATION}) async {
    marker.add(await _addNewMarker(
        markerId: markerId,
        latLng: latLng,
        typeImageInMarker: typeImageInMarker));
    // polyline.add(Polyline(polylineId: PolygonId(markerId),points: ));
  }

  @override
  List<Object?> get props => [googleMapController, marker, streamSubscription];
}
