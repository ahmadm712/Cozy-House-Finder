import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);

    if (result.statusCode == 200) {}

    print(result.body);
  }
}
