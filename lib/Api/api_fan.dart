import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';

Future<List<Builds>> fetchWisata() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiFan.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Fan');
  }
}
