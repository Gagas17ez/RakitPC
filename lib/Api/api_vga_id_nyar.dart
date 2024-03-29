import 'dart:convert';
import 'package:rakit_pc/Models/models_vga.dart';
import 'package:http/http.dart' as http;

class VgaApi {
  static Future<List<Vga>> fetchVgaIdNyar(String query) async {
    final url = Uri.parse("http://103.105.78.74/Api/ApiVga.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List vgaa = json.decode(response.body);

      return vgaa.map((json) => Vga.fromJson(json)).where((vga) {
        final namaLower = vga.namaVga.toLowerCase();
        final merkLower = vga.merkVga.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
