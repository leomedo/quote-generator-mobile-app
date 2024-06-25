import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LocalData {
  static Database? db;

  static Future<Database> initDb() async {
    return db = await openDatabase("favoriteQuotes.db", version: 1,
        onCreate: (Database db, int version) async {
          await createTable(db);
          debugPrint("DbCreated");
        });
  }

  static Future<void> createTable(Database db) async {
    await db.execute("""
    CREATE TABLE favoritesQuotes(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        author TEXT,
        quoteDescription TEXT
      )
      """);
    //debugPrint("table Created");
  }

  // add  to fav
  static Future<int> addFavQuote(String author, String quoteDescription) async {
    final db = await LocalData.initDb();
    final data = {'author':author , 'quoteDescription': quoteDescription};
    final id = await db.insert("favoritesQuotes", data);

    return id;
  }

  // get All fav
  static Future<List<Map<String, dynamic>>> getAllFavQuotes() async {
    final db = await LocalData.initDb();
    return db.query("favoritesQuotes", orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getQuotes(int id) async {
    final db = await LocalData.initDb();
    return db.query("favoritesQuotes", where: "id = ?", whereArgs: [id]);

  }

  // remove Form Favorites



  static Future close() async => db?.close();
}