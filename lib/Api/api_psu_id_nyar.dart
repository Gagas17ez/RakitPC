import 'dart:convert';
import 'package:rakit_pc/Models/models_psu.dart';
import 'package:http/http.dart' as http;

class PsuApi {
  static Future<List<Psu>> fetchPsuIdNyar(String query) async {
    final url = Uri.parse("http://103.105.78.74/Api/ApiPsu.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List psuu = json.decode(response.body);

      return psuu.map((json) => Psu.fromJson(json)).where((psu) {
        final namaLower = psu.namaPsu.toLowerCase();
        final merkLower = psu.merkPsu.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
