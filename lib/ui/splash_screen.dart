import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/app_state_manager.dart';
import 'package:flutter_skeleton/navigation/app_pages.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: ApplicationPages.splashPath,
      key: ValueKey(ApplicationPages.splashPath),
      child: const SplashScreen(),
    );
  }
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initialiseApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const Center(
      ),
    );
  }
}
