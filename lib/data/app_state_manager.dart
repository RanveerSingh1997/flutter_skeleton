import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_cache.dart';

enum UserType { STUDENT, TEACHER, PARENT }

class AppStateManager extends ChangeNotifier {
  final _appCache = AppCache();
  bool _isInitialised = false;
  bool _isOnBoardCompleted = false;
  late UserType _userType;
  bool _isLoggedIn = false;
  bool _isNotConnected = false;
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  AppStateManager() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    initialiseApp();
    appUser();
  }

  StreamSubscription<ConnectivityResult> get connectivitySubscription =>
      _connectivitySubscription;

  bool get isInitialised => _isInitialised;

  bool get isOnBoardCompleted => _isOnBoardCompleted;

  UserType get userType => _userType;

  bool get isLoggedIn => _isLoggedIn;

  String get connectionStatus => _connectionStatus;

  get isNotConnected => _isNotConnected;

  initialiseApp() async {
    Timer(const Duration(milliseconds: 2000), () {
      _isInitialised = true;
      notifyListeners();
    });
    _isOnBoardCompleted = await _appCache.didCompleteOnBoarding();
  }

  appUser() async {
    if (_appCache.isStudentLogin()) {
      _userType = UserType.STUDENT;
    } else if (_appCache.isTeacherLogin()) {
      _userType = UserType.TEACHER;
    } else if (_appCache.isParentLogin()) {
      _userType = UserType.PARENT;
    }
    notifyListeners();
  }

  userLoggedIn() {
    _isLoggedIn = true;
    _appCache.setUserLoggedIn();
    notifyListeners();
  }

  void onBoardComplete() async {
    _isOnBoardCompleted = true;
    await _appCache.setTeacherLogIn();
    await _appCache.completeOnBoarding();
    _userType = UserType.TEACHER;
    notifyListeners();
  }

  void logout() {
    _appCache.clearCache();
    notifyListeners();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        _connectionStatus = "Connected to Network";
        _isNotConnected = true;
        break;
      case ConnectivityResult.none:
        _connectionStatus = "No Internet Connection";
        _isNotConnected = false;
        break;
      default:
        _connectionStatus = 'Failed to get connectivity.';
        _isNotConnected = false;
        break;
    }
    notifyListeners();
  }
}
