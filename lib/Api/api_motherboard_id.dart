import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_motherboard.dart';

Future<List<Motherboard>> fetch_motherboard_id(int id) async {
  String link = "http://103.105.78.74/Api/ApiMotherboardID.php";

  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return motherboardFromJson(response.body);
  } else {
    throw Exception('Failed to load Mobo');
  }
}
