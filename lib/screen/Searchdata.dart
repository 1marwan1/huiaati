import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/modle/myData.dart';
import 'package:hotel_data/screen/SearchdataId.dart';
import 'package:hotel_data/temp/ListNotes.dart';
import 'package:hotel_data/widget/ButtonSheet.dart';
import 'package:hotel_data/widget/myAppbar.dart';
import 'home.dart';
import '../widget/myButon.dart';
import '../widget/myDropdownButton.dart';
import '../widget/myTextboxForm.dart';

class SearchDataPage extends StatefulWidget {
  SearchDataPage({Key? key}) : super(key: key);

  @override
  State<SearchDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<SearchDataPage> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");
  TextEditingController tc = new TextEditingController();

  List<Hoyh> myserchHoyh = [];
  RefrashScreenSearch() async {
    setState(() {
      myserchHoyh.clear();
      myHoyh.forEach((element) {
        if (element.name!.contains(tc.text) || tc.text.trim() == "")
          myserchHoyh.add(element);
      });
    });
  }

  @override
  void initState() {
    RefrashScreenSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Container(
          child: Container(
              //margin: EdgeInsets.symmetric(vertical: 40),
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: myTextboxForm(
                          textEditingController: tc,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        myButonSearch(
                            myFun: () {
                              setState(() {
                                RefrashScreenSearch();
                              });
                            },
                            myIcon: Icons.search),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: myserchHoyh.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 5,
                        height: 5,
                      );
                    },
                    itemBuilder: (context, i) {
                      return Container(
                          child: ListNotes(
                        notes: myserchHoyh[i],
                        docid: myserchHoyh[i].docid,
                        butOnTop: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => showSearchData(
                                    id: i,
                                    name: myHoyh[i].name,
                                    num: myHoyh[i].num,
                                    city: myHoyh[i].city,
                                    data: myHoyh[i].data,
                                    type: myHoyh[i].type,
                                    img: myHoyh[i].img,
                                  )));
                        },
                      ));
                    }),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

//=======================================================================================

              //  FutureBuilder(
              //     future: notesref
              //         .where("userid",
              //             isEqualTo: FirebaseAuth.instance.currentUser?.uid)
              //         .get(),
              //     builder: (context, AsyncSnapshot<dynamic>? snapshot) {
              //       if (snapshot!.hasData) {
              //         return ListView.separated(
              //             itemCount: snapshot.data!.docs.length,
              //             separatorBuilder: (BuildContext context, int index) {
              //               return Divider(
              //                 thickness: 5,
              //                 height: 5,
              //               );
              //             },
              //             itemBuilder: (context, i) {
              //               return Container(
              //                   child: ListNotes(
              //                 notes: snapshot.data.docs[i],
              //                 docid: snapshot.data.docs[i].id,
              //               ));
              //             });
              //       }
              //       return Center(child: CircularProgressIndicator());
              //     }),

//=======================================================================================
// class ListNotes2 extends StatelessWidget {
//   final notes;
//   final docid;
//   ListNotes2({this.notes, this.docid});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => showSearchData(
//                   // id: index,
//                   name: notes['noteName'],
//                   num: notes['noteNumver'],
//                   city: notes['noteCity'],
//                   data: notes['noteDate'],
//                   type: notes['noteType'],
//                   img: notes['imageurl'],
//                 )));
//       },
//       child: Container(
//         height: MediaQuery.of(context).size.height * 15 / 100,
//         margin: EdgeInsets.all(10),
//         padding: EdgeInsets.only(bottom: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 65 / 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       "رقم البطاقة:  " + "${notes['noteNumver']}",
//                       style: TextStyle(
//                         fontFamily: "Cairo",
//                         fontSize: 18,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       " الاسم:  " + "${notes['noteNumver']}",
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                       style: TextStyle(
//                         fontFamily: "Cairo",
//                         fontSize: 18,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       " نوع الهوية:  " + "${notes['noteType']}",
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                       style: TextStyle(
//                         fontFamily: "Cairo",
//                         fontSize: 18,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Image.network("${notes['imageurl']}"),
//             ),
//           ],
//         ),
//       ),
//     );

  
//   }
// }
