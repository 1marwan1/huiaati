import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/enam_and_extintion/enam_type_image_in_marker.dart';

// ignore: must_be_immutable
abstract class MarkerGoogleMap extends Equatable {
  Set<Marker> marker = {};
  StreamSubscription? streamSubscription;
  GoogleMapController? googleMapController;
  Future<void> changeLocationMarker(
      {required String markerId, required LatLng latLng});
  Future<void> addNewMarker(
      {required String markerId,
      required LatLng latLng,
      TypeImageInMarker typeImageInMarker = TypeImageInMarker.ME_LOCATION});
}
