import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_casing.dart';

Future<List<Casing>> fetch_casing_id(int id) async {
  String link = "http://103.105.78.74/Api/ApiCasingID.php";
  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return casingFromJson(response.body);
  } else {
    throw Exception('Failed to load Cpu');
  }
}
