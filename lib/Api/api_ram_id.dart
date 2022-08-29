import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_ram.dart';

Future<List<Ram>> fetchRamId(int id) async {
  String link = "http://103.105.78.74/Api/ApiRamID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return ramFromJson(response.body);
  } else {
    throw Exception('Failed to load Ram');
  }
}
