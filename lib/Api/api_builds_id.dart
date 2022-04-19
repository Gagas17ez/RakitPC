import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/global.dart' as global;

Future<List<Builds>> fetch_builds_id() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiBuildsID.php";
  int pilihan_pc = 1;

  // if (global.budget == 1 && global.kegunaan == 1) {
  //   pilihan_pc = 3;
  // } else {
  //   pilihan_pc = 69;
  // }

  var response =
      await http.post(Uri.parse(link), body: {'ID': pilihan_pc.toString()});

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}
