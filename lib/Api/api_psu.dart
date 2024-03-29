import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_psu.dart';

Future<List<Psu>> fetchPsu() async {
  String link = "http://103.105.78.74/Api/ApiPsu.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return psuFromJson(response.body);
  } else {
    throw Exception('Failed to load Psu');
  }
}
