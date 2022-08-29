import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu_cooler.dart';

Future<List<CpuCooler>> fetchCpuCoolerId(int id) async {
  String link = "http://103.105.78.74/Api/ApiCpuCoolerID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return cpuCoolerFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
