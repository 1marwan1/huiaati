import 'package:flutter/material.dart';

import '../modle/myData.dart';

class ListNotes extends StatelessWidget {
  final Hoyh? notes;
  final docid;
  final index;
  final VoidCallback butOnTop;
  ListNotes({this.notes, required this.butOnTop, this.docid, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: butOnTop,
      child: Container(
        height: MediaQuery.of(context).size.height * 15 / 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 65 / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "رقم البطاقة:  ",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${notes?.num}",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 18,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            " الاسم:  ",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${notes?.name}",
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            " نوع الهوية:  ",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${notes?.type}",
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.network("${notes?.img}"),
            ),
          ],
        ),
      ),
    );
  }
}
