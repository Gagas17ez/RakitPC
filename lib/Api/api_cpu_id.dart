import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_cpu.dart';

Future<List<Cpu>> fetch_cpu_id(int id) async {
  var response = await http.post(
      Uri.parse("http://rakitpc.garuda.net.id/Api/ApiCpuID.php"),
      body: {"ID": id.toString()});

  return cpuFromJson(response.body);
}
