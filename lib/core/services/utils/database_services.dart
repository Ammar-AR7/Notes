import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices extends GetxService {
  static const _name = "Notes.db";
  static const _dbver = 1;

  Database? _db ;
  Database get db => _db!;

  Future <DatabaseServices> init () async {
    if (_db == null){
      final dir = await getDatabasesPath();
      final path = '$dir/$_name';
      _db = await openDatabase(
        path,
        version: _dbver,
        onCreate: (db,version) async {
          await db.execute(
              '''
              CREATE TABLE notes(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              content TEXT NOT NULL,
              created_at INTEGER NOT NULL,
              in_trash INTEGER NOT NULL DEFAULT 0
              );
              '''
          );
        },
        onUpgrade: (db,oldVersion,newVersion) async {

        },
      );
    }
    return this;
  }
}



class NotesProcess {
  final DatabaseServices _dbServices;

  NotesProcess(this._dbServices);

  Database get db => _dbServices.db;

  Future<int> insert(Map<String, dynamic> data) {
    return db.insert(
        'notes', data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(Map<String, dynamic> data) {
    return db.update('notes', data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<int> delete(int id) {
    return db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> moveToTrash(Map<String, dynamic> data) {
    return db.update('notes', data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<List<Map<String, dynamic>>> getAll({String? where,List<dynamic>? whereArgs})
  {
    return db.query(
        'notes',
        where: where,
        whereArgs: whereArgs,
        orderBy: 'created_at DESC'
    );
  }
}
