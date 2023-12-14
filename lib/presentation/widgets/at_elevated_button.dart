import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class ATElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String labelText;
  const ATElevatedButton({super.key, required this.labelText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.darkBlueColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ))),
      child: Text(
        labelText,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
