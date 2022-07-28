import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/global.dart' as global;

Future<List<Builds>> fetch_builds_id() async {
  String link = "http://103.105.78.74/Api/ApiBuildsID.php";
  int pilihan_pc = 0;

  if (global.budget == 1 && global.kegunaan == 1) {
    pilihan_pc = 2;
  } else if (global.budget == 2 && global.kegunaan == 1) {
    pilihan_pc = 3;
  } else if (global.budget == 3 && global.kegunaan == 1) {
    pilihan_pc = 4;
  } else if (global.budget == 4 && global.kegunaan == 1) {
    pilihan_pc = 5;
  } else if (global.budget == 1 && global.kegunaan == 2) {
    pilihan_pc = 6;
  } else if (global.budget == 2 && global.kegunaan == 2) {
    pilihan_pc = 7;
  } else if (global.budget == 3 && global.kegunaan == 2) {
    pilihan_pc = 8;
  } else if (global.budget == 4 && global.kegunaan == 2) {
    pilihan_pc = 9;
  } else if (global.budget == 1 && global.kegunaan == 3) {
    pilihan_pc = 10;
  } else if (global.budget == 2 && global.kegunaan == 3) {
    pilihan_pc = 11;
  } else if (global.budget == 3 && global.kegunaan == 3) {
    pilihan_pc = 12;
  } else if (global.budget == 4 && global.kegunaan == 3) {
    pilihan_pc = 13;
  } else if (global.budget == 1 && global.kegunaan == 4) {
    pilihan_pc = 14;
  } else if (global.budget == 2 && global.kegunaan == 4) {
    pilihan_pc = 15;
  } else if (global.budget == 3 && global.kegunaan == 4) {
    pilihan_pc = 16;
  } else if (global.budget == 4 && global.kegunaan == 4) {
    pilihan_pc = 17;
  } else {
    pilihan_pc = 17;
  }

  var response =
      await http.post(Uri.parse(link), body: {'ID': pilihan_pc.toString()});

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}
