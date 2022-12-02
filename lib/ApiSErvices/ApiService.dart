import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_8/APIs/Url.dart';

import 'package:http/http.dart' as http;

import '../Model/CatagoryItemModel.dart';

class APIService {
  Future<List<dynamic>> getCatagory() async {
    List<dynamic>? catagoryList;
    final response = await http.get(Uri.parse(catagoryUrl));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        catagoryList = data;
        print(catagoryList!.length);
        return catagoryList;
      }
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }

    return catagoryList!;
  }

  Future<List<CatagoryItemModel>> getCatagoryItem(String catagory) async {
    List<CatagoryItemModel>? catagoryItemList;
    final response = await http.get(Uri.parse(catagoryItemUrl + catagory));
    try {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        catagoryItemList =
            data.map((e) => CatagoryItemModel.fromJson(e)).toList();
        print(catagoryItemList!.length);
        return catagoryItemList;
      }
    } on SocketException {
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }

    return catagoryItemList!;
  }
}
