import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_ram.dart';

Future<List<Ram>> fetch_ram_id(int id) async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiRamID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return ramFromJson(response.body);
  } else {
    throw Exception('Failed to load Ram');
  }
}
