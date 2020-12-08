


import 'package:projet_final/Sqflite/database_creator.dart';

class Video {
  int id;
  String name;
  String info;
  String url;

  Video(this.id, this.name, this.info, this.url);

  Video.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.name];
    this.info = json[DatabaseCreator.info];
    this.info = json[DatabaseCreator.url];
  }
}