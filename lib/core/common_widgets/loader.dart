import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';

class Loader {
  Loader(this.context, {this.allowBackButton = false, this.loadingText});
  final bool allowBackButton;
  final BuildContext context;
  final String? loadingText;

  void show() {
    unawaited(
      Navigator.push(
        context,
        PageRouteBuilder(
          fullscreenDialog: true,
          opaque: false,
          barrierColor: Colors.transparent,
          pageBuilder: (_, __, ___) {
            return ProgressLoader(
              allowBackButton: allowBackButton,
              loadingText: loadingText,
            );
          },
        ),
      ),
    );
  }

  void close() {
    Navigator.pop(context);
  }
}

class ProgressLoader extends StatelessWidget {
  const ProgressLoader(
      {this.allowBackButton = false, this.loadingText, Key? key})
      : super(key: key);
  final bool allowBackButton;
  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        return Future.value(allowBackButton);
      },
      child: Scaffold(
        backgroundColor: AppColor.rhino.withOpacity(0.8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const YMargin(kspace),
              Text(
                'Please wait',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              const YMargin(ksmallSpace),
              if (loadingText != null)
                Text(
                  loadingText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
