import 'package:arab_therapy_app/presentation/controllers/splash_controller.dart';
import 'package:arab_therapy_app/core/utils/app_colors.dart';
import 'package:arab_therapy_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  static const routeName = '/splashView';
  SplashView({super.key});

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cyanColor,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset("${AppConstants.svgsAssetsPath}/logo.svg"),
          ),
          const Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: SpinKitThreeBounce(size: 30, color: Color(0xff6DC09C)),
          )
        ],
      ),
    );
  }
}
