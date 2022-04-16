import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/global.dart' as global;

Future<List<Builds>> fetch_id_builds() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiBuilds.php";
  final response =
      await http.post(Uri.parse(link), body: {'id': global.id_builds});

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}
