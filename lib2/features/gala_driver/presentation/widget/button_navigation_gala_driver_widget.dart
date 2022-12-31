import 'package:hotel_data/core/theme/color_app.dart';

import '/core/theme_app.dart';
import 'package:flutter/material.dart';

class ButtonNavigationGalaDriverWidget extends StatelessWidget {
  const ButtonNavigationGalaDriverWidget(
      {Key? key, required this.currentIndex, required this.chingeScreen})
      : super(key: key);
  final int currentIndex;
  final void Function(int) chingeScreen;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: kprimeryColor,
      currentIndex: currentIndex,
      onTap: chingeScreen,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        color: mainOneColor,
        fontWeight: FontWeight.w400,
        fontFamily: "TajawalR",
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(76, 76, 76, 0.8),
        fontFamily: "TajawalR",
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: "حسابي",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          activeIcon: Icon(Icons.grid_view_rounded),
          label: "قائمة الطلبات",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_on_outlined),
          activeIcon: Icon(Icons.notifications_active),
          label: "الإشعارات",
        ),
      ],
    );
  }
}
