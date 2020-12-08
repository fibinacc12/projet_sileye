import 'package:projet_final/Sqflite/database_creator.dart';
import 'package:projet_final/models/video.dart';

class RepositoryServiceTodo {
  static Future<List<Video>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.videoTable}
    WHERE ${DatabaseCreator.id} = ?''';
    final data = await db.rawQuery(sql);
    List<Video> videos = List();

    for (final node in data) {
      final video = Video.fromJson(node);
      videos.add(video);
    }
    return videos;
  }

  static Future<Video> getTodo(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.videoTable}
    WHERE ${DatabaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final video = Video.fromJson(data.first);
    return video;
  }

  static Future<void> addVideo(Video video) async {
    /*final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES 
    (
      ${todo.id},
      "${todo.name}",
      "${todo.info}",
      ${todo.isDeleted ? 1 : 0}
    )''';*/

    final sql = '''INSERT INTO ${DatabaseCreator.videoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.url},
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [video.id, video.name, video.info, video.url];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add video', sql, null, result, params);
  }

  static Future<void> deleteTodo(Video video) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.videoTable}
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [video.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Delete video', sql, null, result, params);
  }

  static Future<void> updateTodo(Video video) async {
    /*final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = "${todo.name}"
    WHERE ${DatabaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DatabaseCreator.videoTable}
    SET ${DatabaseCreator.name} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [video.name, video.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update video', sql, null, result, params);
  }

  static Future<int> videosCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.videoTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}