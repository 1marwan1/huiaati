import 'dart:convert';
import 'package:flutter/widgets.dart';
import '../../features/google_map/data/model/notfication_modle.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseMessageGoogleMap {}

class FirebaseMessageGoogleMapImp extends FirebaseMessageGoogleMap {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  List<NotficationModel> dataNotficationModel = [];
  final String serverToken =
      "BDWq1eRj_gvke2r5AWNj8DuTSEHeSqqCLQXz4JLCcMwUNJGB7vkhGqdCqZzPCsggRsXJnIAezw0yZXnRjblPDV0";
  // ignore: prefer_function_declarations_over_variables
  VoidCallback eventDelegate = () {};
  // ignore:  prefer_function_declarations_over_variables
  VoidCallback eventBackgroudAndIerninatedApp = () {};

  ///! =============================================
  ///?  it operates the following function
  ///*  -  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  ///*   -  FirebaseMessaging.onMessage.listen(showFlutterNotification);
  ///*   -  FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
  ///*   -  initalMessage();
  ///! =============================================
  FirebaseMessageGoogleMapImp() {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
    initalMessage();
  }

  ///! =============================================
  ///? Send Notification by API.
  ///* key [serverToken]
  ///! =============================================

  Future<void> sendPushMessage(String title, String body) async {
    String? token = await getToken();
    if (token == null) {
      return;
    }
    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization':'key=$serverToken'
        },
        body: constructFCMPayload(token, title, body),
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  String constructFCMPayload(String? token, String title, String body) {
    return jsonEncode({
      'token': token,
      'data': {
        'via': 'FlutterFire Cloud Messaging!!!',
        'count': 1,
      },
      'priority': 'high',
      'notification': {
        'title': title,
        'body': body,
      },
    });
  }

  ///! =============================================
  ///? g et Tocken
  ///* FirebaseMessaging.instance.getToken();
  ///! =============================================
  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  ///! =============================================
  ///? is state background when click in Notification
  ///* FirebaseMessaging.instance.getInitialMessage();
  ///! =============================================
  onMessageOpenedApp(RemoteMessage message) {
    showNoiAwsm(message);
    eventBackgroudAndIerninatedApp();
  }

  ///! =============================================
  ///?  if is  Appliction  opened form a Ierninated state
  ///*  FirebaseMessaging.instance.getInitialMessage();
  ///! =============================================
  initalMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      showNoiAwsm(message);
      eventBackgroudAndIerninatedApp();
    }
  }

  ///! =============================================
  ///? Resave Notification in close (background or Ierninated) Aplication.
  ///* FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  ///! =============================================

  Future onBackgroundMessage(RemoteMessage message) async {
    showNoiAwsm(message);
  }

  ///! =============================================
  ///? Resave Notification in Open (foregroun ) Aplication.
  ///* FirebaseMessaging.onMessage.listen(showFlutterNotification);
  ///! =============================================

  void showFlutterNotification(RemoteMessage message) {
    showNoiAwsm(message);
  }

  ///! =============================================
  ///? Show method use disply Notification.
  ///* All back mehtod use this method
  ///! =============================================

  void showNoiAwsm(RemoteMessage message) {
    dataNotficationModel.add(NotficationModel(
        title: message.notification!.title ?? "not title",
        body: message.notification!.body ?? "not body"));
    eventDelegate();
    // ignore: avoid_single_cascade_in_expression_statements
  }
}
