import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_vga.dart';

Future<List<Vga>> fetch_vga() async {
  String link = "http://103.105.78.74/Api/ApiVga.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return vgaFromJson(response.body);
  } else {
    throw Exception('Failed to load Vga');
  }
}
