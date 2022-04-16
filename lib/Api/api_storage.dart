import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_storage.dart';

Future<List<Storage>> fetch_storage() async {
  String link = "http://rakitpc.garuda.net.id/Api/ApiStorage.php";
  final response = await http.get(Uri.parse(link));

  if (response.statusCode == 200) {
    return storageFromJson(response.body);
  } else {
    throw Exception('Failed to load Storage');
  }
}
