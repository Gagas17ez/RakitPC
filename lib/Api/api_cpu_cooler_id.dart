import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu_cooler.dart';

Future<List<CpuCooler>> fetch_cpu_cooler_id(int id) async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiCpuCoolerID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return cpuCoolerFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
