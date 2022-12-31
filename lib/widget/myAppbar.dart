import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

myAppbar(BuildContext context) {
  return AppBar(
      centerTitle: true,
      title: Text(
        "هوياتي",
        style:
            TextStyle(color: Colors.white, fontFamily: "Cairo", fontSize: 25),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app_outlined),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("singeIn");
              } on FirebaseAuthException catch (e) {
                Navigator.of(context).pop();
                AwesomeDialog(
                    context: context,
                    title: "Error",
                    body: Text(
                      e.toString(),
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 16,
                      ),
                    ))
                  ..show();
              } catch (e) {
                Navigator.of(context).pop();
                AwesomeDialog(
                    context: context,
                    title: "Error",
                    body: Text(
                      e.toString(),
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 16,
                      ),
                    ))
                  ..show();
              }
            }),
      ]);
}
