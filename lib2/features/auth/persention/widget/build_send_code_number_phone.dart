import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_data/core/theme/color_app.dart';
import 'package:hotel_data/features/auth/persention/widget/code_input_phone_widget.dart';
import '../../../../core/function/awasm_widget.dart';
import '../../../../core/theme/images.dart';
import '../bloc/signin_bloc/sign_in_bloc_bloc.dart';

class BuildSendCodeNumberPhone extends StatelessWidget {
  const BuildSendCodeNumberPhone(
      {Key? key,
      required this.pinController,
      required this.pinputFocusNode,
      required this.passwordTextController,
      required this.phoneTextController})
      : super(key: key);
  final TextEditingController pinController;
  final TextEditingController phoneTextController;
  final TextEditingController passwordTextController;
  final FocusNode pinputFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 6,
        ),
        Image.asset(
          TypeImage.LOGE_IMAGE.value(),
        ),
        const SizedBox(height: 20, width: double.infinity),
        const Text(
          " تحقق من صحة رقم الهاتف",
          style: TextStyle(
              color: mainOneColor, fontSize: 24, fontFamily: "TajawalB"),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "يرجى إدخال الزمز المكون من 4 أرقام الذي أرسلناه على رقم  \nهاتفك",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: grayTwoColor, fontSize: 14, fontFamily: "TajawalR"),
        ),
        const SizedBox(height: 20),
        CodeInputPhoneWidget(
          pinController: pinController,
          pinputFocusNode: pinputFocusNode,
          onCompeted: (pin) => onCompeted(pin, context),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " لم تستلم رمز التحقق؟ ",
              style: TextStyle(
                  color: grayTwoColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: "TajawalR"),
            ),
            InkWell(
              onTap: () => SendNumberPhone(context),
              child: const Text(
                "إعادة إرسال الرمز",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: mainOneColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "TajawalR"),
              ),
            ),
          ],
        ),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }

  void onCompeted(String pin, BuildContext context) {
    awesomeDialogMessageBoxWidget(context,
        textBody: "جاري  التاكد من عملية المصادقة",
        circularProgressIndicator: true,
        isDismi: false);
    BlocProvider.of<SignInBlocBloc>(context).add(SendOtpPhoneSignInEvent(
        phoneNumber: "+966" + phoneTextController.text, otp: pin));
  }

  // ignore: non_constant_identifier_names
  Future<void> SendNumberPhone(BuildContext context) async {
    awesomeDialogMessageBoxWidget(context,
        textBody: "جاري ارسال رمز التحقق",
        circularProgressIndicator: true,
        isDismi: false);
    BlocProvider.of<SignInBlocBloc>(context).add(ReptSendOtpPhoneSignInEvent(
        phoneNumber: "+966" + phoneTextController.text,
        password: passwordTextController.text));
  }
}
