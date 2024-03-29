import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';

Future<List<Builds>> fetchBuilds() async {
  String link = "http://103.105.78.74/Api/ApiBuilds.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}
