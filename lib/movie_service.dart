import 'dart:convert';
import 'package:http/http.dart';

class MovieService {

  Future getData(String urls) async {
    var url = Uri.parse(urls);
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
