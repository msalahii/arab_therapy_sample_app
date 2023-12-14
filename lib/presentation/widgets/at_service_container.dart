import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class ATServiceContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAssetPath;
  const ATServiceContainer({super.key, required this.title, required this.subtitle, required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 247,
      padding: const EdgeInsets.only(left: 24, right: 24),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: AppColors.greyBorderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAssetPath,
            height: 96,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(height: 2, fontSize: 12),
          )
        ],
      ),
    );
  }
}
