import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/meal.dart';

class DatabaseHelper {
  static const _dbVersion = -1;
  static const _dbName = "favorite.db";

  static Future<Database> GetDatabase() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) => db.execute('''
          CREATE TABLE meals(
            id TEXT PRIMARY KEY,
            categories TEXT,
            title TEXT,
            imageUrl TEXT,
            ingredients TEXT,
            steps TEXT,
            duration INTEGER,
            complexity TEXT,
            affordability TEXT,
            isGlutenFree INTEGER,
            isLactoseFree INTEGER,
            isVegan INTEGER,
            isVegetarian INTEGER
          )
        '''), version: _dbVersion);
  }

  static Future<int> addMeal(Meal meal) async {
    final _db = await GetDatabase();
    return await _db.insert("meals", meal.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deletMeal(Meal meal) async {
    final _db = await GetDatabase();
    return await _db.delete("meals", where: 'id = ?', whereArgs: [meal.id]);
  }

  static Future<List<Meal>?> getAllMeals() async {
    final _db = await GetDatabase();
    final List<Map<String, dynamic>> maps = await _db.query("meals");

    if (maps.isEmpty) {
      return null;
    } else {
      return List.generate(
        maps.length,
        (index) => Meal.fromJson(
          maps[index],
        ),
      );
    }
  }
}
