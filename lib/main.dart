import 'package:flutter/material.dart';
import 'package:hotel_data/screen/Searchdata.dart';
import 'package:hotel_data/screen/bigen.dart';
import 'package:hotel_data/screen/deletedata.dart';
import 'package:hotel_data/screen/info.dart';
import 'package:hotel_data/screen/inputdata.dart';
import 'package:hotel_data/screen/updatadata.dart';
import 'package:hotel_data/screen/updateDataId.dart';
import 'screen/home.dart';
import 'screen/singeUp.dart';
import 'screen/singIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'anmiation.dart';

bool? islogin;

Future backgroudMessage(RemoteMessage message) async {
  print("=================== BackGroud Message ========================");
  print("${message.notification?.body}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroudMessage);

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => fristClass(),
        '/singeIn': (context) => SingeInMarkets(),
        '/SingeUp': (context) => SingeUpMarkets(),
        '/myHome': (context) => myHomePige(),
        '/InputData': (context) => InputDataPage(),
        '/UpdateData': (context) => UpdataDataPage(),
        '/Update': ((context) => Updata()),
        '/DeleteData': (context) => DeleteDataPage(),
        '/SerechData': (context) => SearchDataPage(),
        '/InfoData': (context) => QRInfoPage(),
      },
      title: 'هوياتي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Color.fromARGB(255, 21, 35, 61),
      ),
    );
  }
}
