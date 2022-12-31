import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_data/features/google_map/data/repostry/polyline_points_google_map.dart';
import '../../../data/repostry/markart_google_map.dart';
import '../../widget/dwon_textform_google_map_widget.dart';
import '../../widget/google_map_widget.dart';
import '../../../presention/widget/elvevated_button_google_map-widget.dart';

// ignore: must_be_immutable
class SplitGoogleMapsPage extends StatelessWidget {
  SplitGoogleMapsPage({
    Key? key,
    required this.polylinePointsGoogleMap,
    required this.googleMapController,
    required this.voidCallBakElveatateButtonGM,
    required this.markerGoogleMapImp,
    required this.latController,
    required this.lngController,
    required this.kLake,
  }) : super(key: key);

  PolylinePointsGoogleMapImp? polylinePointsGoogleMap;
  VoidCallback voidCallBakElveatateButtonGM;

  GoogleMapController? googleMapController;
  MarkerGoogleMapImp? markerGoogleMapImp;
  final TextEditingController latController;
  final TextEditingController lngController;
  CameraPosition? kLake;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GoogleMapWidget(
          googleMapController: googleMapController,
          kGooglePlex: kLake,
          markerGoogleMap: markerGoogleMapImp,
          polylinePointsGoogleMap: polylinePointsGoogleMap,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElveatedButtonGoogleMapWidget(
              voidCallBakElveatateButtonGM: voidCallBakElveatateButtonGM,
              nameButton: "بدء التوصيل",
            ),
            DownTextFiledInLatLongMapGoogleWidget(
                latController: latController, lngController: lngController),
          ],
        ),
      ],
    );
  }
}
