import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_data/core/theme/images.dart';
import 'package:hotel_data/features/gala_driver/presentation/view/gala_driver_page.dart';
import '../../../../core/utils/size_config.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .8, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            TypeImage.SPLASH_IMAGE.value(),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const GalaDriverPage());
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (_) => SigninPage()));
    });
  }
}
