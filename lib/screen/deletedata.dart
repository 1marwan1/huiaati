import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hotel_data/modle/myData.dart';
import 'package:hotel_data/screen/SearchdataId.dart';
import 'package:hotel_data/widget/myAppbar.dart';

import '../temp/ListNotes.dart';

class DeleteDataPage extends StatefulWidget {
  DeleteDataPage({Key? key}) : super(key: key);

  @override
  State<DeleteDataPage> createState() => _InputDataPageState();
}

class _InputDataPageState extends State<DeleteDataPage> {
  CollectionReference notesref = FirebaseFirestore.instance.collection("notes");

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Container(
          child: Container(
              //margin: EdgeInsets.symmetric(vertical: 40),
              child: ListView.separated(
                  itemCount: myHoyh.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 5,
                      height: 5,
                    );
                  },
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                            child: ListNotes(
                          notes: myHoyh[i],
                          docid: myHoyh[i].docid,
                          butOnTop: () {},
                        )),
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 21, 35, 61)),
                              child: Text(
                                "حذف",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Cairo",
                                ),
                              ),
                              onPressed: () async {
                                await notesref.doc(myHoyh[i].docid).delete();
                                await FirebaseStorage.instance
                                    .refFromURL(myHoyh[i].img!)
                                    .delete()
                                    .then((value) {
                                  setState(() {
                                    myHoyh.removeAt(i);
                                    print("=================================");
                                    print("Delete");
                                  });
                                });
                              },
                            )),
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}
//=======================================================================================

            // FutureBuilder(
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
            //               return Column(
            //                 children: [
            //                   Container(
            //                       child: ListNotes(
            //                     notes: snapshot.data.docs[i],
            //                     docid: snapshot.data.docs[i].id,
            //                   )),
            //                   Container(
            //                       width: double.infinity,
            //                       child: ElevatedButton(
            //                         style: ElevatedButton.styleFrom(
            //                             primary: Colors.pink),
            //                         child: Text(
            //                           "حذف",
            //                           style: TextStyle(
            //                             fontSize: 20,
            //                             fontFamily: "Cairo",
            //                           ),
            //                         ),
            //                         onPressed: () async {
            //                           await notesref
            //                               .doc(snapshot.data!.docs[i].id)
            //                               .delete();
            //                           await FirebaseStorage.instance
            //                               .refFromURL(
            //                                   snapshot.data.docs[i]['imageurl'])
            //                               .delete()
            //                               .then((value) {
            //                             setState(() {
            //                               print(
            //                                   "=================================");
            //                               print("Delete");
            //                             });
            //                           });
            //                         },
            //                       )),
            //                 ],
            //               );
            //             });
            //       }
            //       return Center(child: CircularProgressIndicator());
            //     }),

//=======================================================================================
// class ListNotes extends StatelessWidget {
//   final notes;
//   final docid;
//   ListNotes({this.notes, this.docid});
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         height: MediaQuery.of(context).size.height * 15 / 100,
//         margin: EdgeInsets.all(10),
//         padding: EdgeInsets.only(bottom: 5),
//         decoration: BoxDecoration(),
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
