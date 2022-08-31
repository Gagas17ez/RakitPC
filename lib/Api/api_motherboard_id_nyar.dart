import 'dart:convert';
import 'package:rakit_pc/Models/models_motherboard.dart';
import 'package:http/http.dart' as http;

class MoboApi {
  static Future<List<Motherboard>> fetchMotherboardIdNyar(String query) async {
    final url = Uri.parse("http://103.105.78.74/Api/ApiMotherboard.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List moboo = json.decode(response.body);

      return moboo.map((json) => Motherboard.fromJson(json)).where((mobo) {
        final namaLower = mobo.namaMobo.toLowerCase();
        final merkLower = mobo.merkMobo.toLowerCase();
        final socketLower = mobo.socketMobo.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower) ||
            socketLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
