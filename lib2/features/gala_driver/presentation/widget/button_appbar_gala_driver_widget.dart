import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_data/core/theme/color_app.dart';

typedef OnTap = void Function(int index);

class ButtonAppGalaDriverWidget extends StatelessWidget {
  const ButtonAppGalaDriverWidget(
      {Key? key, required this.activeButton, required this.onTap})
      : super(key: key);
  final int activeButton;
  final OnTap onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: 5),
      decoration: const BoxDecoration(
          color: Color(0xffEBEEF0),
          // color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttonAppBar(
              tile: "الجديدة",
              index: 0,
              active: activeButton,
            ),
            if (activeButton == 2)
              const Text("|", style: TextStyle(color: secondaryOneColor)),
            buttonAppBar(
              tile: "الحالية",
              index: 1,
              active: activeButton,
            ),
            if (activeButton == 0)
              const Text("|", style: TextStyle(color: secondaryOneColor)),
            buttonAppBar(
              tile: "السابقة",
              index: 2,
              active: activeButton,
            ),
          ]),
    );
  }

  Widget buttonAppBar(
      {required String tile, required int index, required int active}) {
    return active == index ? actaveAppbar(tile) : titleAppbar(tile, index);
  }

  Widget titleAppbar(String tile, int index) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () => onTap(index),
        child: Text(
          tile,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: "TajawalR",
            color: mainOneColor,
          ),
        ),
      ),
    );
  }

  Widget actaveAppbar(String tile) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: mainOneColor,
        ),
        onPressed: () {},
        child: Text(
          tile,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: "TajawalR",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
