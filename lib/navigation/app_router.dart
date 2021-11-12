import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/app_state_manager.dart';
import 'package:flutter_skeleton/navigation/app_pages.dart';
import 'package:flutter_skeleton/ui/loginscreen.dart';
import 'package:flutter_skeleton/ui/network_status_page.dart';
import 'package:flutter_skeleton/ui/onboard_screen.dart';
import 'package:flutter_skeleton/ui/splash_screen.dart';

import 'app_link.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    appStateManager.removeListener(notifyListeners);
    appStateManager.connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialised) ...[
          SplashScreen.page(),
        ] else if (!appStateManager.isNotConnected) ...[
          NetworkStatus.page(),
        ] else if (!appStateManager.isLoggedIn) ...[
          LoginScreen.page(),
        ] else if (!appStateManager.isOnBoardCompleted) ...[
          OnboardingScreen.page(),
        ] else if (appStateManager.isLoggedIn)
          ...[

          ]
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == ApplicationPages.onboardingPath) {
      appStateManager.logout();
    }
    return true;
  }

  @override
  AppLink get currentConfiguration => getCurrentPath();

  AppLink getCurrentPath() {
    return AppLink();
  }

  // 1
  @override
  Future<void> setNewRoutePath(AppLink newLink) async {}
}
