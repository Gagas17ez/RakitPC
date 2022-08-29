import 'package:http/http.dart' as http;
import 'package:rakit_pc/Models/models_builds.dart';
import 'package:rakit_pc/global.dart' as global;

Future<List<Builds>> fetchBuildsId() async {
  String link = "http://103.105.78.74/Api/ApiBuildsID.php";
  int pilihanPc = 0;

  if (global.budget == 1 && global.kegunaan == 1) {
    pilihanPc = 2;
  } else if (global.budget == 2 && global.kegunaan == 1) {
    pilihanPc = 3;
  } else if (global.budget == 3 && global.kegunaan == 1) {
    pilihanPc = 4;
  } else if (global.budget == 4 && global.kegunaan == 1) {
    pilihanPc = 5;
  } else if (global.budget == 1 && global.kegunaan == 2) {
    pilihanPc = 6;
  } else if (global.budget == 2 && global.kegunaan == 2) {
    pilihanPc = 7;
  } else if (global.budget == 3 && global.kegunaan == 2) {
    pilihanPc = 8;
  } else if (global.budget == 4 && global.kegunaan == 2) {
    pilihanPc = 9;
  } else if (global.budget == 1 && global.kegunaan == 3) {
    pilihanPc = 10;
  } else if (global.budget == 2 && global.kegunaan == 3) {
    pilihanPc = 11;
  } else if (global.budget == 3 && global.kegunaan == 3) {
    pilihanPc = 12;
  } else if (global.budget == 4 && global.kegunaan == 3) {
    pilihanPc = 13;
  } else if (global.budget == 1 && global.kegunaan == 4) {
    pilihanPc = 14;
  } else if (global.budget == 2 && global.kegunaan == 4) {
    pilihanPc = 15;
  } else if (global.budget == 3 && global.kegunaan == 4) {
    pilihanPc = 16;
  } else if (global.budget == 4 && global.kegunaan == 4) {
    pilihanPc = 17;
  } else {
    pilihanPc = 17;
  }

  var response =
      await http.post(Uri.parse(link), body: {'ID': pilihanPc.toString()});

  if (response.statusCode == 200) {
    return buildsFromJson(response.body);
  } else {
    throw Exception('Failed to load Builds');
  }
}
