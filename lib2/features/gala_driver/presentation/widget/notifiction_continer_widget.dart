import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_data/core/theme/images.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme_app.dart';
//import 'package:timelines/timelines.dart';

// ignore: must_be_immutable
class NotitctionContinerWidget extends StatelessWidget {
  NotitctionContinerWidget({
    Key? key,
    required this.haveYoyRead,
  }) : super(key: key);
  bool haveYoyRead;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _showNotifcation,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: haveYoyRead
                  ? const Color(0xffFEFEFE)
                  : const Color(0xffEBEEF0),
              border: Border.all(width: 1, color: const Color(0xffEBEEF0)),
              borderRadius: const BorderRadius.all(Radius.circular(18))),
          child: _buildNotificationContinerWiget(),
        ));
  }

  void _showNotifcation() {
    Get.bottomSheet(
      Column(
        children: [
          SizedBox(
            width: Get.width * 0.3,
            child: const Divider(
              thickness: 6,
              height: 6,
              color: mainOneColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            color: Colors.white,
            child: _buildNotificationContinerWiget(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    );
  }

  Widget _buildNotificationContinerWiget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: mainOneColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset(
            TypeImage.LOGETEXT_IMAGE.value(),
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "طلبيه جديده",
                  style: textStylePrimery,
                ),
                Text(
                  "34m ago",
                  style: textStyleSecondary.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              " هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة،    ",
              style: textStyleSecondary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
      ],
    );
  }
}
