import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_casing.dart';

Future<List<Casing>> fetch_casing() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiCasing.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return CasingFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
