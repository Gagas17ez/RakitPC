import 'dart:convert';
import 'package:rakit_pc/Models/models_casing.dart';
import 'package:http/http.dart' as http;

class CasingApi {
  static Future<List<Casing>> fetch_casingID_nyar(String query) async {
    final url = Uri.parse("http://rakitpc.garuda.net.id/Api/ApiCasing.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List casee = json.decode(response.body);

      return casee.map((json) => Casing.fromJson(json)).where((casing) {
        final namaLower = casing.namaCasing.toLowerCase();
        final merkLower = casing.merkCasing.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
