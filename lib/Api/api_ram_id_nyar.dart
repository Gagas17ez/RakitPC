import 'dart:convert';
import 'package:rakit_pc/Models/models_ram.dart';
import 'package:http/http.dart' as http;

class RamApi {
  static Future<List<Ram>> fetchRamIdNyar(String query) async {
    final url = Uri.parse("http://103.105.78.74/Api/ApiRam.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List ramm = json.decode(response.body);

      return ramm.map((json) => Ram.fromJson(json)).where((ram) {
        final namaLower = ram.namaRam.toLowerCase();
        final merkLower = ram.merkRam.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
