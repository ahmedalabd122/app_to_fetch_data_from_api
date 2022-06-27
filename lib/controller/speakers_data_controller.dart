import 'dart:convert';
import '../model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final getDataFuture =
ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<DataModel> listDataModel = [];

  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    listDataModel = [];
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://sessionize.com/api/v2/8wk2u51q/view/SpeakerWall#"));
      var data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        listDataModel.add(DataModel.fromMap(data[i]));
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
