import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/models/search_model.dart';
import 'package:flutter_skeleton/service/network/api_service.dart';

class DataProvider extends ChangeNotifier {
  APIService _apiService = APIService();
  SearchModel searchModel=SearchModel(results: [], imageResults: [], answers: [], ts: 0, deviceRegion:'', deviceType: '');
  late String _query;
  String get query => _query;
  set query(String value) {
    _query = value;
    notifyListeners();
  }

  Future<bool> gettingSearchResult() async {
    var response = await _apiService.search(query);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      searchModel = SearchModel.fromMap(data);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
