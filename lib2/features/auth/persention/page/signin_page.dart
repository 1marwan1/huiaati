import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hotel_data/core/theme/images.dart';
import 'package:hotel_data/features/auth/persention/widget/build_input_numer_phone.dart';
import 'package:hotel_data/features/auth/persention/widget/build_send_code_number_phone.dart';
import 'package:hotel_data/features/gala_driver/presentation/view/gala_driver_page.dart';
import '../../../../core/function/awasm_widget.dart';
import '../bloc/signin_bloc/sign_in_bloc_bloc.dart';
import '/injection_container.dart' as di;

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final pinController = TextEditingController();
  final pinputFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SignInBlocBloc>(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: Stack(children: <Widget>[
                _opacitybackground(),
                _opacityfrontground(),
                BlocConsumer<SignInBlocBloc, SignInBlocState>(
                  builder: (context, state) {
                    if (state is SingeInBlocInitial ||
                        state is ErrorLoginState) {
                      return BuildInputNumberPhoneWidget(
                        phoneTextController: _phoneTextController,
                        passwordTextController: _passwordTextController,
                      );
                    } else if (state is VerifyOpBlocInitial ||
                        state is SendNumberPhoneBlocState ||
                        state is SignInSuccessfildBlocState) {
                      return BuildSendCodeNumberPhone(
                          pinController: pinController,
                          phoneTextController: _phoneTextController,
                          passwordTextController: _passwordTextController,
                          pinputFocusNode: pinputFocusNode);
                    } else if (state is SignInSuccessfulBlocState) {
                      return BuildSendCodeNumberPhone(
                          pinController: pinController,
                          phoneTextController: _phoneTextController,
                          passwordTextController: _passwordTextController,
                          pinputFocusNode: pinputFocusNode);
                    } else {
                      Get.back();
                      return BuildInputNumberPhoneWidget(
                        phoneTextController: _phoneTextController,
                        passwordTextController: _passwordTextController,
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is ErrorLoginState) {
                      showMessageError(state.message, context);
                    } else if (state is SignInSuccessfildBlocState) {
                      showMessageError(state.message, context);
                    } else if (state is SendNumberPhoneBlocState) {
                      Get.back();
                      // awesomeDialogMessageBoxWidget(
                      //   context,
                      //   textBody:
                      //       "تم تسجيل الدخول يجيب ان تقوم بادخال الرمز المرسل لهاتفك",
                      //   dialogType: DialogType.SUCCES,
                      // );
                    } else if (state is SignInSuccessfulBlocState) {
                      Get.back();
                      Get.off(const GalaDriverPage());
                    }
                  },
                ),
              ]))),
    );
  }

  void showMessageError(String message, BuildContext context) {
    Get.back();
    awesomeDialogMessageBoxWidget(
      context,
      textBody: message,
      dialogType: DialogType.ERROR,
    );
  }

  Widget _opacitybackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          opacity: 0.12,
          image: AssetImage(
            TypeImage.PATTERN_IMAGE.value(),
          ),
        ),
      ),
      height: 280.0,
    );
  }

  Widget _opacityfrontground() {
    return Container(
      height: 280.0,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.white,
              ],
              stops: const [
                0.0,
                1.0
              ])),
    );
  }
}
