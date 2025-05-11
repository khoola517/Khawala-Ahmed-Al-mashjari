import 'package:finallproject/core/tables/vaccine_table.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  static late final Database db;
//انا مسحت ستاتك من هنا مندري ايش سبب
   static Future<void> initialize() async {
    String path = await _getDbPath();
    db = await openDatabase(path, onCreate: _onCreate, version: 1,);   
  }
//call only one when create db
  static void _onCreate(Database db, int version) async {
    print('Here onCreate');
    //ceate table
    await db.execute(VaccineTable.create);
  }
  // _onUpgrade(Database db,int oldversion,int newversion){
  //   print("upgrade===========================================");
  // }
  static Future<void> clearUserTables() async {
    final batch = db.batch();

    batch.delete(VaccineTable.vaccine);

    await batch.commit(noResult: true);
  }

  static Future<void> deleteDb() async {
    String path = await _getDbPath();
    return deleteDatabase(path);
  }

  static Future<String> _getDbPath() async {
    String databasePath = await getDatabasesPath();
    return '$databasePath/khawala.db';
  }
}