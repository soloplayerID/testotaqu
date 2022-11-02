
// ignore_for_file: avoid_print

part of 'resources.dart';

class DestinationDatabase {
  static final DestinationDatabase instance = DestinationDatabase._init();

  static Database? _database;

  DestinationDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('destinations.db');
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
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDestinations ( 
  ${DestinationFields.id} $idType, 
  ${DestinationFields.typeSource} $textType,
  ${DestinationFields.packetTypeId} $integerType,
  ${DestinationFields.typeName} $textType,
  ${DestinationFields.name} $textType
  )
''');
  }

  Future<Destination> create(Destination destination) async {
    final db = await instance.database;

    // final json = destination.toJson();
    // final columns =
    //     '${DestinationFields.title}, ${DestinationFields.description}, ${DestinationFields.time}';
    // final values =
    //     '${json[DestinationFields.title]}, ${json[DestinationFields.description]}, ${json[DestinationFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableDestinations, destination.toJson());
    return destination.copy(id: id);
  }

  Future<Destination> readDestination(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDestinations,
      columns: DestinationFields.values,
      where: '${DestinationFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Destination.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Destination>> read(String query) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDestinations,
      columns: DestinationFields.values,
      where: '${DestinationFields.name} LIKE ?',
      whereArgs: ['%$query%'],
    );

    if (maps.isNotEmpty) {
      // return Destination.fromJson(maps.first);
      print('getData');
      return maps.map((json) => Destination.fromJson(json)).toList();
    } else {
      print('getData kosong');
      throw Exception('$query not found');
    }
  }

  Future<List<Destination>> readAllDestinations() async {
    final db = await instance.database;

    // const orderBy = '${DestinationFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableDestinations ORDER BY $orderBy');

    final result = await db.query(tableDestinations);

    return result.map((json) => Destination.fromJson(json)).toList();
  }

  Future<int> update(Destination destination) async {
    final db = await instance.database;

    return db.update(
      tableDestinations,
      destination.toJson(),
      where: '${DestinationFields.id} = ?',
      whereArgs: [destination.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDestinations,
      where: '${DestinationFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int?> tableIsEmpty() async {
    var db = await instance.database;

    int? count =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM destination'));

    print(count);
    return count;
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    return db.close();
  }
}
