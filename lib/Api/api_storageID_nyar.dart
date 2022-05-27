import 'dart:convert';
import 'package:rakit_pc/Models/models_storage.dart';
import 'package:http/http.dart' as http;

class StorageApi {
  static Future<List<Storage>> fetch_storageID_nyar(String query) async {
    final url = Uri.parse("http://rakitpc.garuda.net.id/Api/ApiStorage.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List storagee = json.decode(response.body);

      return storagee.map((json) => Storage.fromJson(json)).where((storage) {
        final namaLower = storage.namaStorage.toLowerCase();
        final merkLower = storage.merkStorage.toLowerCase();
        final searchLower = query.toLowerCase();

        return namaLower.contains(searchLower) ||
            merkLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
