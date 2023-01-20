import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_mobile/core/core.dart';
import 'package:test_mobile/feature/auth/view/login_screen.dart';
import 'package:test_mobile/feature/business/viewmodel/business_viewmodel.dart';
import 'package:test_mobile/feature/dashboard/viewmodel/dashboard_viewmodel.dart';

import 'di.dart';
import 'feature/auth/viewmodel/auth_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Root(
      child: MaterialApp(
        title: 'Test Mobile',
        theme: ThemeData(
          primaryColor: AppColor.matisse,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

class Root extends StatelessWidget {
  const Root({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewmodel>(
          create: (_) => locator<AuthViewmodel>(),
        ),
        ChangeNotifierProvider<BusinessViewmodel>(
          create: (_) => locator<BusinessViewmodel>(),
        ),
        ChangeNotifierProvider<DashboardViewmodel>(
          create: (_) => locator<DashboardViewmodel>(),
        ),
      ],
      child: child,
    );
  }
}
