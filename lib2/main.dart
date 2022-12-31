import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/features/google_map/data/model/notfication_modle.dart';
import 'core/firebase/firebase_message.dart';
import 'core/theme_app.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/splash_view.dart';
import 'injection_container.dart' as di;

List<NotficationModel> dataNotficationModel = [];
Future backgroudMessage(RemoteMessage message) async {
  dataNotficationModel.add(NotficationModel(
      title: message.notification!.title ?? "not title",
      body: message.notification!.body ?? "not body"));
}

FirebaseMessageGoogleMapImp? firebaseMessageGoogleMapImp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroudMessage);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    firebaseMessageGoogleMapImp = FirebaseMessageGoogleMapImp();
    FirebaseMessaging.onMessage.listen(backgroudMessage);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gala D',
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      locale: const Locale("ar"),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: kprimeryColor,
      ),
    );
  }
}
