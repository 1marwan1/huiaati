import '../../domain/repostry/polyline_points_google_map_domain.dart';
import '/core/theme_app.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class PolylinePointsGoogleMapImp extends PolylinePointsGoogleMap {
  @override
  addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: kprimeryColor,
        width: 2,
        points: polylineCoordinates);
    polylines[id] = polyline;
  }

  @override
  Future<void> getPolyline(
      {required LatLng latLngLocationMe,
      required LatLng latLngLocationCustmer}) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(latLngLocationMe.latitude, latLngLocationMe.longitude),
      PointLatLng(
          latLngLocationCustmer.latitude, latLngLocationCustmer.longitude),
      travelMode: TravelMode.driving,
    );

    // ignore: avoid_print
    print(result.errorMessage);
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    addPolyLine();
  }
}
