import 'package:flutter/material.dart';
import '../widget/myServiesInWidget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.shopping_cart),
                ),
                accountName: Container(
                  width: double.infinity,
                  child: Text(
                    "مروان محمد ",
                    style: myStyleText,
                  ),
                ),
                accountEmail: Text(
                  "mmrwan593@gamil.com",
                  style: myStyleText,
                  textAlign: TextAlign.end,
                  textDirection: TextDirection.ltr,
                )),
            myListDrow(context,
                myIcon: Icons.person,
                myText: "الصفحة الشخصية",
                func: '/myProfider'),
            myListDrow(context,
                myIcon: Icons.home_work_sharp, myText: "الصفحة الرئيسية"),
            myListDrow(context, myIcon: Icons.add_alert, myText: "الاعلانات"),
            myListDrow(context,
                myIcon: Icons.add_business_outlined, myText: "الاقسام"),
            myListDrow(context, myIcon: Icons.settings, myText: "الاعدادات"),
            myListDrow(context, myIcon: Icons.style, myText: "ثيم التطبيق"),
          ],
        ),
      ),
    );
  }

  Column myListDrow(BuildContext Context,
      {IconData? myIcon, @required String? myText, String? func = '/myHome'}) {
    return Column(children: [
      ListTile(
        onTap: () => Navigator.of(Context).pushNamed(func!),
        title: Text(
          myText!,
          style: myStyleText,
        ),
        leading: Icon(
          myIcon!,
          size: 30,
          //  color: Colors.pink[300],
        ),
      ),
      Divider(
        thickness: 2,
      )
    ]);
  }
}
