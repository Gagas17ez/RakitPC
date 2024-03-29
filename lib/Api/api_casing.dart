import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_casing.dart';

Future<List<Casing>> fetchCasing() async {
  String link = "http://103.105.78.74/Api/ApiCasing.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return casingFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
