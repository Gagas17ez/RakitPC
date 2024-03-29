import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_ram.dart';

Future<List<Ram>> fetchRam() async {
  String link = "http://103.105.78.74/Api/ApiRam.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return ramFromJson(response.body);
  } else {
    throw Exception('Failed to load Ram');
  }
}
