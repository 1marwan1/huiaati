import 'package:flutter/material.dart';
import '../widget/myAppbar.dart';

class ShowInfromation extends StatelessWidget {
  // ShowInfromation({Key? key}) : super(key: key);
  final String? SrcImage;
  ShowInfromation(@required this.SrcImage);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: myAppbar(context),
        body: Center(
          child: Hero(
            tag: "marwan mohammed ahmed  ali",
            child: Image.asset(
              SrcImage!,
            ),
          ),
        ),
      ),
    );
  }
}
