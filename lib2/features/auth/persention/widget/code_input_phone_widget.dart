import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/theme/color_app.dart';

class CodeInputPhoneWidget extends StatelessWidget {
  final TextEditingController pinController;
  final FocusNode pinputFocusNode;
  final void Function(String pin) onCompeted;
  const CodeInputPhoneWidget(
      {Key? key,
      required this.pinController,
      required this.onCompeted,
      required this.pinputFocusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: pinController,
        pinAnimationType: PinAnimationType.rotation,
        length: 4,
        onCompleted: onCompeted,
        focusNode: pinputFocusNode,
        defaultPinTheme: PinTheme(
          width: 45,
          height: 45,
          textStyle: const TextStyle(
              fontSize: 24, color: grayTwoColor, fontWeight: FontWeight.w500),
          decoration: BoxDecoration(
            border: Border.all(color: mainOneColor, width: 1),
            borderRadius: BorderRadius.circular(9),
          ),
        ),

        //   onSubmitted: CheckCodePhone,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      ),
    );
  }
}
