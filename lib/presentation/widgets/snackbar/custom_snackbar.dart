import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter_svg/svg.dart';

class CustomSnackbar {
  Future<bool?> success(BuildContext context, String title, String content) {
    return context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        shouldIconPulse: false,
        backgroundColor: const Color.fromARGB(255, 11, 153, 84),
        controller: controller,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.top,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/success_icon.svg",
          semanticsLabel: "Success",
          width: 50,
          height: 50,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Future<bool?> error(BuildContext context, String title, String content) {
    return context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 3),
      builder: (context, controller) => FlashBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        shouldIconPulse: false,
        backgroundColor: const Color.fromARGB(255, 246, 81, 81),
        controller: controller,
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.bounceIn,
        position: FlashPosition.top,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/error_icon.svg",
          semanticsLabel: "Success",
          width: 50,
          height: 50,
          fit: BoxFit.scaleDown,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          content,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
