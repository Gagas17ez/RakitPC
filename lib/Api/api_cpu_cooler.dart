import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu_cooler.dart';

Future<List<CpuCooler>> fetchCpuCooler() async {
  String link = "http://103.105.78.74/Api/ApiCpuCooler.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return cpuCoolerFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
