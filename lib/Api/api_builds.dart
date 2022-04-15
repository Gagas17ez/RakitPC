import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';

Future<List<Builds>> fetchWisata() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiBuilds.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}

// Future<Builds> fetchBuilds() async {
//   final response = await http
//       .get(Uri.parse('http://rakitpc.garuda.net.id/Api/ApiBuilds.php'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Builds.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Builds');
//   }
// }
