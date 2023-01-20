// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/di.dart';
import 'package:test_mobile/feature/auth/viewmodel/auth_viewmodel.dart';
import 'package:test_mobile/feature/dashboard/view/screens/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.alabaster,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kmediumSpace,
                    vertical: kxtraLargeSpace + kspace),
                margin: const EdgeInsets.symmetric(
                    horizontal: kspace, vertical: 120),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        if (value.length < 3) {
                          return 'Please enter a valid name';
                        }
                        return null;
                      },
                    ),
                    const YMargin(kxtraLargeSpace),
                    CustomTextField(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (value.length < 5) {
                          return 'Paswword is weak';
                        }
                        return null;
                      },
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await login(context);
                        }
                      },
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
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    final loader = Loader(context);
    final model = locator<AuthViewmodel>();
    loader.show();
    await model.login(
        username: nameController.text.trim(),
        password: passwordController.text.trim());
    loader.close();
    if (model.success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      Alert.show(context, description: model.error.description);
    }
  }
}
