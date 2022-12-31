import 'package:flutter/cupertino.dart';
import 'package:hotel_data/core/enam_and_extintion/enam_type_image_in_marker.dart';
import 'package:hotel_data/core/theme/color_app.dart';
import 'package:hotel_data/core/theme_app.dart';
import 'package:hotel_data/features/gala_driver/presentation/widget/button_appbar_gala_driver_widget.dart';
import 'package:hotel_data/features/gala_driver/presentation/widget/button_navigation_gala_driver_widget.dart';
import 'package:hotel_data/features/gala_driver/presentation/widget/notifiction_continer_widget.dart';
import 'package:hotel_data/features/gala_driver/presentation/widget/requests_gala_driver_widget.dart';
import 'package:hotel_data/main.dart';
import '../../../../core/function/awasm_widget.dart';
import 'package:flutter/material.dart';

class GalaDriverPage extends StatefulWidget {
  const GalaDriverPage({Key? key}) : super(key: key);
  @override
  State<GalaDriverPage> createState() => _GalaDriverPageState();
}

class _GalaDriverPageState extends State<GalaDriverPage> {
  @override
  void initState() {
    super.initState();
  }

  int numberScrean = 1;
  void chingeScreen(int numberScrean) {
    setState(() {
      this.numberScrean = numberScrean;
    });
  }

  int activeButton = 0;
  void chingeActiveButton(int activeButton) {
    setState(() {
      this.activeButton = activeButton;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    firebaseMessageGoogleMapImp?.eventDelegate = () => setState(() {
          awesomeDialogWidget(context);
        });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: numberScrean == 1 ? 0 : 1,
        centerTitle: true,
        title: Text(
          ["الملف الشخصي", "قائمة الطلبات", "الاشعارات"][numberScrean],
          style: const TextStyle(
            fontFamily: "TajawalB",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: mainOneColor,
          ),
        ),
      ),
      body: [
        Column(children: [
          Container(
            child: ListTile(
              leading: Image.asset(
                TypeImageInMarker.PERSON_PROVIEL.value(),
                width: 50,
                height: 50,
              ),
              title: const Text(
                "مروان محمد ",
                style: textStylePrimery,
              ),
              subtitle: const Text(
                "+967715888006",
                style: textStyleSecondary,
                textAlign: TextAlign.end,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: mainTwoColor,
                    child: Icon(Icons.person, color: mainOneColor),
                  ),
                  title: const Text(
                    " نشط ",
                    style: textStylePrimery,
                  ),
                  trailing: CupertinoSwitch(
                    value: true,
                    onChanged: (bool v) {},
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: mainTwoColor,
                    child: Icon(Icons.star_rate_rounded, color: mainOneColor),
                  ),
                  title: Row(
                    children: [
                      Text(
                        " تقييمك ",
                        style: textStylePrimery,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.black26),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const Text(
                              " 4.5 ",
                              style: textStyleSecondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(children: [
                //   Container(
                //     child: Row(
                //       children: [
                //         const Text(
                //           " 4.5 ",
                //           style: textStyleSecondary,
                //         ),
                //         Icon(
                //           Icons.star_rate_rounded,
                //           color: Colors.amber,
                //           size: 20,
                //         )
                //       ],
                //     ),
                //   )
                // ]),
                const ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: mainTwoColor,
                    child: Icon(Icons.translate_outlined, color: mainOneColor),
                  ),
                  title: const Text(
                    " اللغة ",
                    style: textStylePrimery,
                  ),
                  trailing: const Text(
                    " English ",
                    style: textStyleSecondary,
                  ),
                ),
                const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: mainTwoColor,
                      child:
                          Icon(Icons.exit_to_app_rounded, color: mainOneColor),
                    ),
                    title: Text(
                      " تسجيل الخروج ",
                      style: textStylePrimery,
                    )),
              ],
            ),
          ),
        ]),
        Column(
          children: [
            ButtonAppGalaDriverWidget(
              activeButton: activeButton,
              onTap: chingeActiveButton,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) =>
                    InfoRequestsGalaDriverWidget(typeRequests: activeButton),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) =>
              NotitctionContinerWidget(haveYoyRead: index % 3 == 0),
        ),
      ][numberScrean],
      bottomNavigationBar: ButtonNavigationGalaDriverWidget(
          currentIndex: numberScrean, chingeScreen: chingeScreen),
    );
  }
}
//? ================================================
//! key + lat + Long
//? ================================================
//AIzaSyDrpmwkpRX_sEtGZKFQevi065A0hh134y4
//14.04315460893916
//44.09235991537572
