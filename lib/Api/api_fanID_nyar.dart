import 'dart:convert';
import 'package:rakit_pc/Models/models_fan.dart';
import 'package:http/http.dart' as http;

class FanApi {
  static Future<List<Fan>> fetch_fanID_nyar(String query) async {
    final url = Uri.parse("http://rakitpc.garuda.net.id/Api/ApiFan.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List fann = json.decode(response.body);

      return fann.map((json) => Fan.fromJson(json)).where((fan) {
        final namaLower = fan.namaFans.toLowerCase();
        final merkLower = fan.merkFans.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
