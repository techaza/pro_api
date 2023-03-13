import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pro_api/models/list_model.dart';

class ListProvider extends ChangeNotifier {
  final Dio dio = Dio();
  PurpleList? k;
  var url = "https://reqres.in/api/users?page=2";
  fetchList() async {
    try {
      final response = await dio.get(url);
      notifyListeners();
      print(response.data);
      k = PurpleList.fromJson(response.data);
    } catch (e) {
      print('$e//////12///////////12/////////');
      throw Exception('Failed to fetch list: $e');
    }
  }
}
