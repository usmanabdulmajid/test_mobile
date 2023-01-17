import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile/core/common_widgets/custom_textfield.dart';
import 'package:test_mobile/core/core.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.alabaster,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kmediumSpace, vertical: kxtraLargeSpace + kspace),
              margin:
                  const EdgeInsets.symmetric(horizontal: kspace, vertical: 120),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(kTinyBorderRadius),
                border: Border.all(color: AppColor.catskillWhite),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/coatOfArms.png',
                        width: 50,
                        height: 50,
                      ),
                      const XMargin(ktinyspace),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Ministry of',
                            style: TextStyle(
                              color: AppColor.stormGrey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Commerce',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: AppColor.stormGrey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const YMargin(kxtraLargeSpace),
                  CustomTextField(
                    label: 'Email or Username',
                    hintText: 'Enter your email',
                    controller: nameController,
                    keyboardType: TextInputType.name,
                  ),
                  const YMargin(kxtraLargeSpace),
                  CustomTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                        color: AppColor.matisse,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  const YMargin(kLargeSpace + kspace),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColor.matisse),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(AppColor.white),
                    ),
                    child: SizedBox(
                      width: size.width,
                      child: const Padding(
                        padding: EdgeInsets.all(ksmallSpace),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
