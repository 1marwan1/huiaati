import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hoyh {
  Hoyh(
      {this.city,
      this.img,
      this.data,
      this.id,
      this.name,
      this.num,
      this.type,
      this.docid});

  final int? id;
  late final String? num;
  late final String? name;
  late final String? type;
  late final String? data;
  late final String? city;
  late final String? img;
  final String? docid;

  factory Hoyh.fromJson(Map<String, dynamic> json, String docid) {
    return Hoyh(
      city: json["noteCity"],
      img: json["imageurl"],
      data: json["noteDate"],
      name: json["noteName"],
      num: json["noteNumver"],
      type: json["noteType"],
      docid: docid,
    );
  }
  //Map<String, dynamic> toJson() => {};
}

StartGetmethod() async {
  if (myHoyh.length == 0) {
    CollectionReference notesref =
        FirebaseFirestore.instance.collection("notes");

    var responsBody = await notesref
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    responsBody.docs.forEach((QueryDocumentSnapshot<dynamic> element) {
      myHoyh.add(Hoyh.fromJson(element.data(), element.id));
    });
  }
  for (int i = 0; i < myHoyh.length; i++) print(myHoyh[i].name);
}

List<Hoyh> myHoyh = [];
