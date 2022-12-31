import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myDropdownButton extends StatefulWidget {
  myDropdownButton(
    this.dataItame, {
    this.valueQsm = "",
    Key? key,
  }) : super(key: key);
  late List<String> dataItame;
  String? valueQsm = " ";
  @override
  State<myDropdownButton> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<myDropdownButton> {
  @override
  void initState() {
    valdrow = (widget.valueQsm != null)
        ? widget.valueQsm
        : (this.widget.dataItame != null && this.widget.dataItame.length > 0)
            ? this.widget.dataItame[0]
            : "اختار";
    Provider.of<myType>(context, listen: false).chaingValue(valdrow!);
    print("1=========###" + this.widget.valueQsm!);
    print("2=========###" + this.widget.dataItame[0]);
    super.initState();
  }

  String? valdrow = "اختار";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 8 / 100,
      width: MediaQuery.of(context).size.width * 90 / 100,
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 1 / 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: DropdownButton(
        items: this
            .widget
            .dataItame
            .map(
              (e) => DropdownMenuItem(
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      e,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Cairo",
                        //  color: Colors.black,
                      ),
                    ),
                  ),
                  value: e),
            )
            .toList(),
        isExpanded: true,
        onChanged: (val) {
          setState(() {
            valdrow = val.toString();

            print(valdrow);
          });
          Provider.of<myType>(context, listen: false).chaingValue(valdrow!);
        },
        value: valdrow,
        iconEnabledColor: Theme.of(context).primaryColor,
        style: TextStyle(
          fontSize: 16,
          fontFamily: "Cairo",
          color: Theme.of(context).primaryColor,
        ),
        iconSize: 30,
        underline: Divider(
          thickness: 0.0,
          height: 0.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class myType extends ChangeNotifier {
  String? value = "marwan";

  chaingValue(String val) {
    value = val;
    print(val);
    notifyListeners();
  }
}
