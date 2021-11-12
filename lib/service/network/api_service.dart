import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_skeleton/service/network/api_url.dart';
import 'package:http/http.dart' as http;
class APIService {
  var headers = {
    'x-user-agent': 'desktop',
    'x-proxy-location': 'US',
    'x-rapidapi-host': 'google-search3.p.rapidapi.com',
    'x-rapidapi-key': '4b18d57db2msh2225eda3403a9e9p10043fjsnb50cd384910a'
  };

  Future<http.Response> search(String string)async{
    Uri uri=Uri.parse(APIUrl.Search_URL+"q=$string&num=100");
    var response=await http.get(uri,headers:headers);
    return response;
  }


}
