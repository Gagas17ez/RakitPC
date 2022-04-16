import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_fan.dart';

Future<List<Fan>> fetch_fan() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiFan.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return fanFromJson(response.body);
  } else {
    throw Exception('Failed to load Fan');
  }
}
