// ignore_for_file: depend_on_referenced_packages, prefer_const_declarations

import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model/user.dart';

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();
  static Database? _database;

  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $usersTable( 
      ${UsersField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${UsersField.userName} TEXT,
      ${UsersField.userEmail} TEXT,
      ${UsersField.password} TEXT,
      ${UsersField.phone} TEXT,
      ${UsersField.age} TEXT,
      ${UsersField.height} TEXT,
      ${UsersField.weight} TEXT)

    
    ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;
    final id = await db.insert(usersTable, user.toJson());
    log('create');

    return user.copy(id: id);
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final orderBy = UsersField.userName;
    final result = await db.query(usersTable, orderBy: orderBy);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}



















