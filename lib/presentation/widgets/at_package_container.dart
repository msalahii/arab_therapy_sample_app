import 'package:arab_therapy_app/core/utils/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/app_colors.dart';

class ATPackageContainer extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final Widget discountTextWidget;
  final String price;
  final String priceSubtitle;
  final Widget firstBenefitTextWidget;
  final Widget secondBenefitTextWidget;
  final Widget thirdBenefitTextWidget;
  final bool showLabel;

  const ATPackageContainer(
      {super.key,
      required this.svgIconPath,
      required this.title,
      required this.discountTextWidget,
      required this.price,
      required this.showLabel,
      required this.priceSubtitle,
      required this.firstBenefitTextWidget,
      required this.secondBenefitTextWidget,
      required this.thirdBenefitTextWidget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showLabel)
          Positioned(
            top: 24,
            left: 0,
            child: Container(
                width: 100,
                height: 24,
                decoration: const BoxDecoration(
                    color: Color(0xffFEBC37),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Center(
                  child: Text(
                    "popular".tr(),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.greyBorderColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(svgIconPath),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      discountTextWidget,
                      Row(
                        children: [
                          Text(
                            price,
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff4E7E76)),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            r"$",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xff4E7E76)),
                          ),
                        ],
                      ),
                      Text(priceSubtitle),
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                height: 1,
                width: double.infinity,
                color: AppColors.greyBorderColor,
              ),
              PackageBenefitListTile(benefitTextWidget: firstBenefitTextWidget),
              const SizedBox(height: 20),
              PackageBenefitListTile(benefitTextWidget: secondBenefitTextWidget),
              const SizedBox(height: 20),
              PackageBenefitListTile(benefitTextWidget: thirdBenefitTextWidget),
            ],
          ),
        ),
      ],
    );
  }
}

class PackageBenefitListTile extends StatelessWidget {
  final Widget benefitTextWidget;
  const PackageBenefitListTile({super.key, required this.benefitTextWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: SvgPicture.asset("${AppConstants.svgsAssetsPath}/tick.svg"),
        ),
        const SizedBox(width: 10),
        Expanded(child: benefitTextWidget)
      ],
    );
  }
}
