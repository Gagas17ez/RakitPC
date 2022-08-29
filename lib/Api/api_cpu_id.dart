import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu.dart';

Future<List<Cpu>> fetchCpuId(int id) async {
  var response = await http.post(
      Uri.parse("http://103.105.78.74/Api/ApiCpuID.php"),
      body: {"ID": id.toString()});

  return cpuFromJson(response.body);
}
