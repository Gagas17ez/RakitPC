import 'package:http/http.dart' as http;

import 'package:rakit_pc/Models/models_storage.dart';

Future<List<Storage>> fetch_storage_id(int id) async {
  String link = "http://103.105.78.74/Api/ApiStorageID.php";

  final response =
      await http.post(Uri.parse(link), body: {'ID': id.toString()});

  if (response.statusCode == 200) {
    return storageFromJson(response.body);
  } else {
    throw Exception('Failed to load Storage');
  }
}
