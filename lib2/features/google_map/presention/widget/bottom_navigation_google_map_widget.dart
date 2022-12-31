import '/core/theme_app.dart';
import 'package:flutter/material.dart';

class ButtonNavigationGoogleMapWidget extends StatelessWidget {
  const ButtonNavigationGoogleMapWidget(
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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_on_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_module_rounded),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          label: "",
        )
      ],
    );
  }
}
