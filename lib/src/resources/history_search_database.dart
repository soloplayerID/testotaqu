// ignore_for_file: avoid_print

part of 'resources.dart';

class HistoryDatabase {
  static final HistoryDatabase instance = HistoryDatabase._init();

  static Database? _database;

  HistoryDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('history.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableHistoryHistorys ( 
  ${HistoryFields.id} $idType, 
  ${HistoryFields.typeName} $textType,
  ${HistoryFields.name} $textType
  )
''');
  }

  Future<History> create(History destination) async {
    final db = await instance.database;

    // final json = destination.toJson();
    // final columns =
    //     '${HistoryFields.title}, ${HistoryFields.description}, ${HistoryFields.time}';
    // final values =
    //     '${json[HistoryFields.title]}, ${json[HistoryFields.description]}, ${json[HistoryFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableHistoryHistorys, destination.toJson());
    return destination.copy(id: id);
  }

  Future<History> readHistory(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHistoryHistorys,
      columns: HistoryFields.values,
      where: '${HistoryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return History.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<History>> read(String query) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHistoryHistorys,
      columns: HistoryFields.values,
      where: '${HistoryFields.name} LIKE ?',
      whereArgs: ['%$query%'],
    );

    if (maps.isNotEmpty) {
      // return History.fromJson(maps.first);
      print('getData');
      return maps.map((json) => History.fromJson(json)).toList();
    } else {
      print('getData kosong');
      throw Exception('$query not found');
    }
  }

  Future<List<History>> readAllHistorys() async {
    final db = await instance.database;

    // const orderBy = '${HistoryFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableHistoryHistorys ORDER BY $orderBy');

    final result = await db.query(tableHistoryHistorys);

    return result.map((json) => History.fromJson(json)).toList();
  }

  Future<int> update(History destination) async {
    final db = await instance.database;

    return db.update(
      tableHistoryHistorys,
      destination.toJson(),
      where: '${HistoryFields.id} = ?',
      whereArgs: [destination.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableHistoryHistorys,
      where: '${HistoryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int?> tableIsEmpty() async {
    var db = await instance.database;

    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM history'));

    print(count);
    return count;
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    return db.close();
  }
}
