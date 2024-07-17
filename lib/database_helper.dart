import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('phonics.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const phonicsTable = '''
    CREATE TABLE phonics (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      letter TEXT NOT NULL,
      small_img TEXT NOT NULL,
      big_img TEXT NOT NULL,
      audio TEXT NOT NULL
    );
    ''';

    await db.execute(phonicsTable);

    await db.insert('phonics', {
      'letter': 'A',
      'small_img': 'assets/small_img/a.jpg',
      'big_img': 'assets/big_img/a_apple.jpg',
      'audio': 'mp3/a-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'B',
      'small_img': 'assets/small_img/b.jpg',
      'big_img': 'assets/big_img/b_bat.jpg',
      'audio': 'mp3/b-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'C',
      'small_img': 'assets/small_img/c.jpg',
      'big_img': 'assets/big_img/c_cat.jpg',
      'audio': 'mp3/c-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'D',
      'small_img': 'assets/small_img/d.jpg',
      'big_img': 'assets/big_img/d_dog.jpg',
      'audio': 'mp3/d-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'E',
      'small_img': 'assets/small_img/e.jpg',
      'big_img': 'assets/big_img/e_egg.jpg',
      'audio': 'mp3/e-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'F',
      'small_img': 'assets/small_img/f.jpg',
      'big_img': 'assets/big_img/f_fish.jpg',
      'audio': 'mp3/f-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'G',
      'small_img': 'assets/small_img/g.jpg',
      'big_img': 'assets/big_img/g_girl.jpg',
      'audio': 'mp3/g-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'H',
      'small_img': 'assets/small_img/h.jpg',
      'big_img': 'assets/big_img/h_hat.jpg',
      'audio': 'mp3/h-song.mp3'
    });

    await db.insert('phonics', {
      'letter': 'I',
      'small_img': 'assets/small_img/i.jpg',
      'big_img': 'assets/big_img/i_in.jpg',
      'audio': 'mp3/i-song.mp3'
    });
  }

  Future<List<Map<String, dynamic>>> getPhonics() async {
    final db = await instance.database;
    return await db.query('phonics');
  }
}
