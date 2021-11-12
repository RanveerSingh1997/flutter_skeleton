import 'package:flutter/material.dart';
import 'package:flutter_skeleton/navigation/app_pages.dart';

import '../app_language.dart';

class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: ApplicationPages.loginPath,
      key: ValueKey(ApplicationPages.loginPath),
      child: LoginScreen(),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageHelper? lang = LanguageHelper.of(context);
    var height = MediaQuery.of(context).size.height;
    return Material();
  }
}
