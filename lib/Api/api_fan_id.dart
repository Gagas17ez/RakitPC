import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_fan.dart';

Future<List<Fan>> fetch_fan_id(int id) async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiFanID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return fanFromJson(response.body);
  } else {
    throw Exception('Failed to load Fan');
  }
}
