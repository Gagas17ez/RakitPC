import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_psu.dart';

Future<List<Psu>> fetchPsuId(int id) async {
  String link = "http://103.105.78.74/Api/ApiPsuID.php";

  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return psuFromJson(response.body);
  } else {
    throw Exception('Failed to load Psu');
  }
}
