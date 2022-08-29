import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu.dart';

Future<List<Cpu>> fetchCpu() async {
  String link = "http://103.105.78.74/Api/ApiCpu.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return cpuFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
