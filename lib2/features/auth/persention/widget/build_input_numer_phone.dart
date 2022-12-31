import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_data/core/function/awasm_widget.dart';
import 'package:hotel_data/features/auth/persention/widget/text_form_phone_widget.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/images.dart';
import '../../../../core/widget/button_widget.dart';
import '../bloc/signin_bloc/sign_in_bloc_bloc.dart';

// ignore: must_be_immutable
class BuildInputNumberPhoneWidget extends StatelessWidget {
  BuildInputNumberPhoneWidget(
      {Key? key,
      required this.phoneTextController,
      required this.passwordTextController})
      : super(key: key);
  TextEditingController phoneTextController;
  TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 8,
        ),
        Image.asset(
          TypeImage.LOGE_IMAGE.value(),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "تسجيل الدخول",
          style: TextStyle(
              color: mainOneColor, fontSize: 24, fontFamily: "TajawalB"),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          " ادخل رقم هاتفك لتتمكن من متابعة الطلبات ",
          style: TextStyle(
              color: grayTwoColor, fontSize: 12, fontFamily: "TajawalR"),
        ),
        TextFormPhoneWidget(
            name: "رقم الهاتف", controller: phoneTextController),
        TextFormPhoneWidget(
          name: "كلمة السر",
          controller: passwordTextController,
          password: true,
        ),
        ButtonWidget(
            voidCallBakElveatateButtonGM: () => SendNumberPhone(context),
            nameButton: "تسجيل الدخول"),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> SendNumberPhone(BuildContext context) async {
    awesomeDialogMessageBoxWidget(context,
        textBody: "جاري تسخيل الدخول",
        circularProgressIndicator: true,
        isDismi: false);
    BlocProvider.of<SignInBlocBloc>(context).add(SendNumberPhoneSignInEvent(
        phoneNumber: "+966" + phoneTextController.text,
        password: passwordTextController.text));
  }
}
