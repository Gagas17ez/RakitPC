import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:rakit_pc/Models/models_simpan_build.dart';

class MySqflite {
  static const _databaseName = "SimpanBuild.db";

  static const _databaseV1 = 5;
  static const tableSimpanBuild = 'Build';

  static const columnIdSimpan = 'idSimpan';
  static const columnCompatible = 'compatible';
  static const columnHarga = 'harga';
  static const columnWaktu = 'waktu';
  static const columnIdCasing = 'idCasing';
  static const columnIdCpu = 'idCpu';
  static const columnIdCpuCooler = 'idCpuCooler';
  static const columnIdMotherboard = 'idMotherboard';
  static const columnIdPsu = 'idPsu';
  static const columnIdRam1 = 'idRam1';
  static const columnIdRam2 = 'idRam2';
  static const columnIdStorage1 = 'idStorage1';
  static const columnIdStorage2 = 'idStorage2';
  static const columnIdVga = 'idVga';
  static const columnIdFan1 = 'idFan1';
  static const columnIdFan2 = 'idFan2';
  static const columnIdFan3 = 'idFan3';

  // make this a singleton class
  MySqflite._privateConstructor();

  static final MySqflite instance = MySqflite._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    return await openDatabase(path, version: _databaseV1,
        onCreate: (db, version) async {
      var batch = db.batch();
      _onCreateTableSimpanBuild(batch);

      await batch.commit();
    });
  }

  void _onCreateTableSimpanBuild(Batch batch) async {
    batch.execute('''
          CREATE TABLE $tableSimpanBuild (
            $columnCompatible INTEGER,
            $columnHarga TEXT,
            $columnWaktu TEXT,
            $columnIdCasing INTEGER,
            $columnIdCpu INTEGER,
            $columnIdCpuCooler INTEGER,
            $columnIdMotherboard INTEGER,
            $columnIdPsu INTEGER,
            $columnIdRam1 INTEGER,
            $columnIdRam2 INTEGER,
            $columnIdStorage1 INTEGER,
            $columnIdStorage2 INTEGER,
            $columnIdVga INTEGER,
            $columnIdFan1 INTEGER,
            $columnIdFan2 INTEGER,
            $columnIdFan3 INTEGER
          )
          ''');
  }

  ///TABLE MAHASISWA
  Future<int> insertBuild(SimpanBuild model) async {
    var row = {
      columnCompatible: model.compatible,
      columnHarga: model.harga,
      columnWaktu: model.waktu,
      columnIdCasing: model.idCasing,
      columnIdCpu: model.idCpu,
      columnIdCpuCooler: model.idCpuCooler,
      columnIdMotherboard: model.idMotherboard,
      columnIdPsu: model.idPsu,
      columnIdRam1: model.idRam1,
      columnIdRam2: model.idRam2,
      columnIdStorage1: model.idStorage1,
      columnIdStorage2: model.idStorage2,
      columnIdVga: model.idVga,
      columnIdFan1: model.idFan1,
      columnIdFan2: model.idFan2,
      columnIdFan3: model.idFan3,
    };

    Database db = await instance.database;
    return await db.insert(tableSimpanBuild, row);
  }

  Future<List<SimpanBuild>> getBuild() async {
    Database db = await instance.database;
    var allData = await db.rawQuery("SELECT * FROM $tableSimpanBuild");

    List<SimpanBuild> result = [];
    for (var data in allData) {
      result.add(SimpanBuild(
        compatible: data[columnCompatible].toString(),
        harga: int.parse(data[columnHarga].toString()),
        waktu: data[columnWaktu].toString(),
        idCasing: int.parse(data[columnIdCasing].toString()),
        idCpu: int.parse(data[columnIdCpu].toString()),
        idCpuCooler: int.parse(data[columnIdCpuCooler].toString()),
        idMotherboard: int.parse(data[columnIdMotherboard].toString()),
        idPsu: int.parse(data[columnIdPsu].toString()),
        idRam1: int.parse(data[columnIdRam1].toString()),
        idRam2: int.parse(data[columnIdRam2].toString()),
        idStorage1: int.parse(data[columnIdStorage1].toString()),
        idStorage2: int.parse(data[columnIdStorage2].toString()),
        idVga: int.parse(data[columnIdVga].toString()),
        idFan1: int.parse(data[columnIdFan1].toString()),
        idFan2: int.parse(data[columnIdFan2].toString()),
        idFan3: int.parse(data[columnIdFan3].toString()),
      ));
    }
    return result;
  }

  Future<SimpanBuild?> getBuildbyWaktu(String waktu) async {
    Database db = await instance.database;
    var allData = await db.rawQuery(
        "SELECT * FROM $tableSimpanBuild WHERE $columnWaktu = $waktu LIMIT 1");

    if (allData.isNotEmpty) {
      return SimpanBuild(
        compatible: allData[0][columnWaktu] as String,
        harga: int.parse(allData[0][columnHarga] as String),
        waktu: allData[0][columnWaktu] as String,
        idCasing: int.parse(allData[0][columnIdCasing] as String),
        idCpu: int.parse(allData[0][columnIdCpu] as String),
        idCpuCooler: int.parse(allData[0][columnIdCpuCooler] as String),
        idMotherboard: int.parse(allData[0][columnIdMotherboard] as String),
        idPsu: int.parse(allData[0][columnIdPsu] as String),
        idRam1: int.parse(allData[0][columnIdRam1] as String),
        idRam2: int.parse(allData[0][columnIdRam2] as String),
        idStorage1: int.parse(allData[0][columnIdStorage1] as String),
        idStorage2: int.parse(allData[0][columnIdStorage2] as String),
        idVga: int.parse(allData[0][columnIdVga] as String),
        idFan1: int.parse(allData[0][columnIdFan1] as String),
        idFan2: int.parse(allData[0][columnIdFan1] as String),
        idFan3: int.parse(allData[0][columnIdFan1] as String),
      );
    } else {
      return null;
    }
  }

  Future<int> deleteBuild(String waktuh) async {
    Database db = await instance.database;
    return await db.rawDelete('DELETE * FROM $tableSimpanBuild');
  }

  clearData(String waktuh) async {
    Database db = await instance.database;
    await db.rawQuery(
        "DELETE FROM $tableSimpanBuild WHERE $columnWaktu = '$waktuh'");
  }
}
