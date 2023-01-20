// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:test_mobile/core/core.dart';

class Alert {
  static Future<void> show(
    BuildContext context, {
    String? title,
    required String description,
    bool success = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await Flushbar(
      //title: title,
      message: description.isEmpty ? 'Something went wrong' : description,
      margin: const EdgeInsets.all(kmediumSpace),
      padding: const EdgeInsets.all(kmediumSpace),
      borderRadius: BorderRadius.circular(kborderRadius),
      icon: success
          ? const Icon(Icons.done_rounded, color: AppColor.white)
          : const Icon(
              Icons.error,
              color: AppColor.white,
            ),
      backgroundColor: success ? Colors.green : const Color(0xFFFF5E5E),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
