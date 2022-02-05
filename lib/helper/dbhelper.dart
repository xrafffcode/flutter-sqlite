import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database ?_db;

  // ignore: constant_identifier_names
  static const String QUERY_TBL_PELANGGAN = """
    CREATE TABLE IF NOT EXISTS pelanggan (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama TEXT,
      gender TEXT,
      tgl_lhr TEXT,
    )
  """;
  
  static Future<Database?> db() async{
    return _db ??= (await DBHelper().konekDB());
  }
  
  Future<Database> konekDB()async{
    return await openDatabase('dbsaya.db', version: 1, onCreate: (db, version){
      db.execute(QUERY_TBL_PELANGGAN);
    });
  }
}