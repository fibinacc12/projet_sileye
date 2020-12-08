import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'projet_final.db'),
        onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Videos(name TEXT, videoUrl VARCHAR)');
      await db.execute('''
        CREATE TABLE Users(username VARCHAR, password VARCHAR)
        ''');
    }, version: 1);
  }

  newVideo(newVideo) async {
    final db = await database;

    var res = db.rawInsert('''+ 
      INSERT INTO Videos (
        name, videoUrl
        ) VALUES (?, ?)
    ''', [newVideo.name, newVideo.videoUrl]);

    return res;
  }

  newUser(newUser) async {
    final db = await database;

    var res = db.rawInsert('''+ 
      INSERT INTO Users (
        username, password
        ) VALUES ('Sileye', 'admin12345')
    ''', [newUser.username, newUser.password]);

    return res;
  }

  Future<dynamic> getVideo() async {
    final db = await database;

    var res = await db.query('Videos');

    if (res.length == 0) {
      return null;
    } else {
      var resMap = res[0];
      return resMap.isNotEmpty ? resMap : null;
    }
  }
}
