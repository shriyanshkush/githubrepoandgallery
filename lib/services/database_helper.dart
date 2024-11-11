import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('bookmarks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bookmarks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT NOT NULL
      )
    ''');
  }

  Future<void> addBookmark(String imageUrl) async {
    final db = await instance.database;
    await db.insert('bookmarks', {'imageUrl': imageUrl});
  }

  Future<void> removeBookmark(String imageUrl) async {
    final db = await instance.database;
    await db.delete('bookmarks', where: 'imageUrl = ?', whereArgs: [imageUrl]);
  }

  Future<List<String>> getBookmarks() async {
    final db = await instance.database;
    final result = await db.query('bookmarks');

    return result.map((row) => row['imageUrl'] as String).toList();
  }
}
