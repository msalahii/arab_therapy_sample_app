import 'package:arab_therapy_app/presentation/views/sample_data_view.dart';
import 'package:arab_therapy_app/presentation/widgets/at_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_constants.dart';

class HomeHeroSectionContainer extends StatelessWidget {
  const HomeHeroSectionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 490,
      color: AppColors.cyanColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  SvgPicture.asset("${AppConstants.svgsAssetsPath}/logo.svg", height: 24),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.toNamed(SampleDataView.routeName),
                    child: Container(
                        width: 84,
                        height: 32,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.darkBlueColor),
                        child: Center(
                            child: Text(
                          tr("startNow"),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ))),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 38, right: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${AppConstants.imagesAssetsPath}/chat.png",
                    height: 82,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tr("homeSubtitle"),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      tr("speakWithSpecialist"),
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                      width: 205,
                      child: ATElevatedButton(
                        labelText: tr("startNow"),
                        onPressed: () => Get.toNamed(SampleDataView.routeName),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
