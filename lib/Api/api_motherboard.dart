import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_motherboard.dart';

Future<List<Motherboard>> fetchMotherboard() async {
  String link = "http://103.105.78.74/Api/ApiMotherboard.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return motherboardFromJson(response.body);
  } else {
    throw Exception('Failed to load Mobo');
  }
}
