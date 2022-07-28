import 'dart:convert';
import 'package:rakit_pc/Models/models_cpu.dart';
import 'package:http/http.dart' as http;

class CpuApi {
  static Future<List<Cpu>> fetch_cpuID_nyar(String query) async {
    final url = Uri.parse("http://103.105.78.74/Api/ApiCpu.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cpuu = json.decode(response.body);

      return cpuu.map((json) => Cpu.fromJson(json)).where((cpu) {
        final namaLower = cpu.namaCpu.toLowerCase();
        final merkLower = cpu.merkCpu.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
