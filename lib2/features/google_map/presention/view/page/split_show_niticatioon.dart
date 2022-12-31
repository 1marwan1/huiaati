import 'package:flutter/material.dart';
import '../../../../../core/theme_app.dart';
import '../../../../../main.dart';

class SplitShowNiticatioon extends StatelessWidget {
  const SplitShowNiticatioon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimeryColor,
      padding: const EdgeInsets.all(50),
      alignment: Alignment.center,
      child: dataNotficationModel.isNotEmpty
          ? ListView.builder(
              itemCount: dataNotficationModel.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                      dataNotficationModel[index].title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      dataNotficationModel[index].body,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))
          : const Text(
              "لا توجد اشعارات",
              style: TextStyle(
                  fontFamily: "Cairo", fontSize: 20, color: Colors.white),
            ),
    );
  }
}
