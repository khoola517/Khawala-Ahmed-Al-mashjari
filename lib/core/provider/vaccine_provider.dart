import 'package:finallproject/core/database/sqflite_database.dart';
import 'package:finallproject/core/models/vaccine_model.dart';
import 'package:finallproject/core/tables/vaccine_table.dart';

class VaccineProvider {
  final _db = SqfliteDatabase.db; 

  Future<VaccineModel> addVaccine(VaccineModel vaccine) async {
    vaccine.id = await _db.insert(VaccineTable.vaccine, vaccine.toMap());
    return vaccine;
  }

  Future<VaccineModel?> getVaccine(int id) async {
    List<Map> maps = await _db.query(
      VaccineTable.vaccine,
      where: '${VaccineTable.id} = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) 
    return VaccineModel.fromMap(maps.first);
    return null;
  }

  Future<Future<int>> updateVaccine(VaccineModel vaccine) async {
print(vaccine.title);
    return _db.update(
      VaccineTable.vaccine,
      vaccine.toMap(),
      where: '${VaccineTable.id} = ?',
      whereArgs: [vaccine.id,vaccine.title],
    );
  }

  Future<Future<int>> deleteVaccine(int id) async {
    return _db.delete(
      VaccineTable.vaccine,
      where: '${VaccineTable.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<VaccineModel>> getVaccines() async {
    List<Map> list = await _db.query(VaccineTable.vaccine);
    return list.map((a) => VaccineModel.fromMap(a)).toList();
  }
}
