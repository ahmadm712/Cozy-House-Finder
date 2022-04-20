import 'dart:convert';

import 'package:cozy_house_finder/models/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  List<SpaceModel> _listSpace = [];

  List<SpaceModel> get spaces => _listSpace;

  Future<List<SpaceModel>> getRecommendedSpace() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);
    List<SpaceModel> spaces = [];

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      spaces = data.map((space) => SpaceModel.fromJson(space)).toList();
    } else {
      <SpaceModel>[];
    }
    print(result.body);
    return spaces;
  }
}
