import 'package:hotel_data/features/google_map/presention/view/page/split_google_maps_page.dart';
import 'package:hotel_data/features/google_map/presention/view/page/split_send_nofipage.dart';
import 'package:hotel_data/features/google_map/presention/view/page/split_show_niticatioon.dart';
import 'package:hotel_data/main.dart';
import '../../../../core/chach_location/cahck_location.dart';
import '../../../../core/enam_and_extintion/enam_type_image_in_marker.dart';
import '../../../../core/function/awasm_widget.dart';
import '../../data/repostry/markart_google_map.dart';
import '../../data/repostry/polyline_points_google_map.dart';
import '/core/enam_and_extintion/extintion_to_double.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import '../widget/bottom_navigation_google_map_widget.dart';

class GoogelMapsPage extends StatefulWidget {
  const GoogelMapsPage({Key? key}) : super(key: key);
  @override
  State<GoogelMapsPage> createState() => _GoogelMapsPageState();
}

class _GoogelMapsPageState extends State<GoogelMapsPage> {
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lngController = TextEditingController();
  final TextEditingController _tockenController = TextEditingController();
  final PolylinePointsGoogleMapImp polylinePointsGoogleMapImp =
      PolylinePointsGoogleMapImp();
  Position? position;

  GoogleMapController? googleMapController;
  MarkerGoogleMapImp? markerGoogleMapImp = MarkerGoogleMapImp();
  CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 33.440717697143555,
      zoom: 16.151926040649414);

  @override
  void initState() {
    _goToTheLake();
    super.initState();
  }

  int numberScrean = 1;
  void chingeScreen(int numberScrean) {
    setState(() {
      this.numberScrean = numberScrean;
    });
  }

  @override
  Widget build(BuildContext context) {
    firebaseMessageGoogleMapImp?.eventDelegate = () => setState(() {
          awesomeDialogWidget(context);
        });
    return Scaffold(
      body: [
        const SplitShowNiticatioon(),
        SplitGoogleMapsPage(
          polylinePointsGoogleMap: polylinePointsGoogleMapImp,
          googleMapController: googleMapController,
          voidCallBakElveatateButtonGM: voidCallBakElveatateButtonGM,
          markerGoogleMapImp: markerGoogleMapImp,
          latController: _latController,
          lngController: _lngController,
          kLake: _kLake,
        ),
        SplitSendNofipage(
          tockenController: _tockenController,
          sendButtonEvent: () async {
            setState(() {});
            _tockenController.text =
                (await firebaseMessageGoogleMapImp!.getToken())!;
            await firebaseMessageGoogleMapImp!.sendPushMessage(
                "Notication marwan", "marwan mohammed ahmed ali hussein");
          },
        ),
      ][numberScrean],
      bottomNavigationBar: ButtonNavigationGoogleMapWidget(
          currentIndex: numberScrean, chingeScreen: chingeScreen),
    );
  }

  //! ==========================================================================
  //?   Start Funtion Google Map
  //! ==========================================================================

  voidCallBakElveatateButtonGM() async {
    await markerGoogleMapImp!.addNewMarker(
        markerId: "customer",
        typeImageInMarker: TypeImageInMarker.CUSTOMER_LOCATION,
        latLng: LatLng(
            _latController.text.toDouble(), _lngController.text.toDouble()));
    setState(() {});
  }

  //! ==========================================================================
  //?   End Funtion Google Map
  //! ==========================================================================

  Future<void> _getMyLocation() async {
    position = await CheckLocation.getLatLog();

    if (position != null) {
      _kLake = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 16.4746,
        bearing: 0,
        tilt: 0,
      );
    }
  }

  Future<void> _goToTheLake() async {
    if (await CheckLocation.locationServiceEnabled(context)) {
      await _getMyLocation();
      await markerGoogleMapImp!
          .addNewMarker(markerId: "me", latLng: _kLake.target);
      setState(() {});
    }
  }
}
//? ================================================
//! key + lat + Long
//? ================================================
//AIzaSyDrpmwkpRX_sEtGZKFQevi065A0hh134y4
//14.04315460893916
//44.09235991537572
