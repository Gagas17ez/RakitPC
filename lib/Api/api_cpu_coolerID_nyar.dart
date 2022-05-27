import 'dart:convert';
import 'package:rakit_pc/Models/models_cpu_cooler.dart';
import 'package:http/http.dart' as http;

class CpuCoolerApi {
  static Future<List<CpuCooler>> fetch_cpu_coolerID_nyar(String query) async {
    final url = Uri.parse("http://rakitpc.garuda.net.id/Api/ApiCpuCooler.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cpuCooler = json.decode(response.body);

      return cpuCooler.map((json) => CpuCooler.fromJson(json)).where((cooler) {
        final namaLower = cooler.namaCooler.toLowerCase();
        final merkLower = cooler.merkCooler.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
