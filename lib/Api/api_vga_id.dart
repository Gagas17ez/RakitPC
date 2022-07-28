import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_vga.dart';

Future<List<Vga>> fetch_vga_id(int id) async {
  String link = "http://103.105.78.74/Api/ApiVgaID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return vgaFromJson(response.body);
  } else {
    throw Exception('Failed to load Vga');
  }
}
