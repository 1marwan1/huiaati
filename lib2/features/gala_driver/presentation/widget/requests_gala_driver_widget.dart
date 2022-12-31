import 'package:flutter/material.dart';
import 'package:hotel_data/features/gala_driver/presentation/widget/timeline_widget.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme_app.dart';

class InfoRequestsGalaDriverWidget extends StatelessWidget {
  InfoRequestsGalaDriverWidget({Key? key, required this.typeRequests})
      : super(key: key);
  final int typeRequests;
  List<Widget>? request = [];

  @override
  Widget build(BuildContext context) {
    request!.clear();
    for (int i = 1; i <= typeRequests; i++) {
      request!.add(
        _startConnectionOrSendDeliveredHanded(
          tile: "بدء التوصيل",
          body: "22 أكتوبر 2022 | " "11:00 AM",
        ),
      );
    }
    // _startConnectionOrSendDeliveredHanded(
    //   tile: "بدء التوصيل",
    //   body: "22 أكتوبر 2022 | " "11:00 AM",
    // ),
    // if (typeRequests >= 2)
    //   _startConnectionOrSendDeliveredHanded(
    //     tile: "تم التسليم",
    //     body: "22 أكتوبر 2022 | " "11:30 AM",
    //   ),

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: const Color(0xffFEFEFE),
          border: Border.all(width: 1, color: const Color(0xffEBEEF0)),
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "رقم الطلب  GSHN4Y52F000HHT# ",
            style: textStylePrimery,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.timer_outlined,
                  color: Color(0xffBF4E4E),
                  size: 18,
                ),
                Text(
                  "12 AM - 10 AM ~ ",
                  textDirection: TextDirection.ltr,
                  style: textStyleSecondary.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.time_to_leave,
                  color: grayTwoColor,
                  size: 18,
                ),
                Text("~ 65 د (30 كم)",
                    style: textStyleSecondary.copyWith(fontSize: 16)),
              ],
            ),
          ),
          if (typeRequests >= 1)
            Timeline(
              indicatorColor: mainOneColor,
              indicatorSize: 15,
              lineColor: mainOneColor,
              indicatorStyle: PaintingStyle.fill,
              style: PaintingStyle.stroke,
              lineGap: 0,
              itemGap: 10,
              padding: const EdgeInsets.all(0),
              children: request!,
            ),
          // if (typeRequests >= 1)
          //   Stack(
          //     children: [
          //       Column(children: [
          //         _startConnectionOrSendDeliveredHanded(
          //           tile: "بدء التوصيل",
          //           body: "22 أكتوبر 2022 | " "11:00 AM",
          //         ),
          //         const SizedBox(height: 10),
          //         if (typeRequests >= 2)
          //           _startConnectionOrSendDeliveredHanded(
          //             tile: "تم التسليم",
          //             body: "22 أكتوبر 2022 | " "11:30 AM",
          //           ),
          //       ]),
          //     ],
          //   ),
          const SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: grayTwoColor,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text("المدينة المنورة - ينبع - 	حي الصفا",
                    style: textStyleSecondary.copyWith(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _startConnectionOrSendDeliveredHanded(
      {required String tile, required String body}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      //  color: Colors.amber,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //   const Icon(Icons.circle, color: mainOneColor, size: 18),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tile, style: textStylePrimery),
              const SizedBox(height: 5),
              Text(body, style: textStyleSecondary),
            ],
          ),
        ],
      ),
    );
  }
}
