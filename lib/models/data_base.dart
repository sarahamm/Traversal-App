import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static final DataBaseService instance = DataBaseService._constrctor();
  DataBaseService._constrctor();
  static Database? _db;

  final String _dbFileName = "places_table_db.db"; // file name
  final String _placesTable = "placesTable"; // table name

  Future<Database> get dataBase async {
    if (_db != null) return _db!;
    _db = await initData();
    return _db!;
  }

  Future<Database> initData() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, _dbFileName);

    // await deleteDatabase(databasePath);

    final database = await openDatabase(
      databasePath,
      version: 5,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return database;
  }

  _onCreate(db, version) async {
    //all place content table
    await db.execute('''
        CREATE TABLE $_placesTable (
         placeID INTEGER PRIMARY KEY AUTOINCREMENT,
         PlaceTitle TEXT,
         placeSubTitle TEXT,
         placeImgUrl TEXT,
         placeDescription TEXT
        )
        ''');

    // place flags table
    await db.execute('''
        CREATE TABLE flagsTable (
        flagID INTEGER PRIMARY KEY AUTOINCREMENT,
        flagName TEXT 
        )''');

    // place tags table
    await db.execute('''
        CREATE TABLE tagsTable (
        tagID INTEGER PRIMARY KEY AUTOINCREMENT,
        tagName TEXT 
        )''');

    // table have joint between place table and flags table
    await db.execute('''
        CREATE TABLE placeFlagsTable (
        placeID INTEGER ,
        flagID INTEGER,
        FOREIGN KEY (placeID) REFERENCES $_placesTable (placeID),
        FOREIGN KEY (flagID) REFERENCES flagsTable (flagID)
        )
        ''');

    await db.rawInsert('''
  INSERT INTO flagsTable(flagName) 
  VALUES 
    ('Adventure'),
    ('Discover New Culture'),
    ('Vacation'),
    ('Job Trip')
''');

    await db.rawInsert('''
  INSERT INTO tagsTable(tagName) 
  VALUES 
    ('Favourite_Places'),
    ('Want To Visit'),
    ('Visited'),
    ('Planned')
''');
    // table have joint between place table and flags table
    await db.execute('''
        CREATE TABLE placesTagsTable (
        placeID INTEGER ,
        tagID INTEGER,
        tagWplaceJointID INTEGER PRIMARY KEY AUTOINCREMENT,
        FOREIGN KEY (placeID) REFERENCES $_placesTable (placeID),
        FOREIGN KEY (tagID) REFERENCES tagsTable (tagID)
        )''');
  }

  _onUpgrade(Database db, int oldV, int newV) async {
    await db.execute('''
ALTER TABLE $_placesTable
ADD COLUMN tags TEXT''');

    await db.execute('''
ALTER TABLE $_placesTable
ADD COLUMN flags TEXT''');

    //print("on UpgradeMethod //////////////");
  }

  Future<void> insertPlace(
    String title,
    String subtitle,
    String imageUrl,
    String desc,
  ) async {
    final db = await dataBase;
    //print('⭕️⭕️⭕️');
    //print(await db.query("sqlite_master"));

    await db.insert(_placesTable, {
      'PlaceTitle': title,
      'placeSubTitle': subtitle,
      'placeImgUrl': imageUrl,
      'placeDescription': desc,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
    //print("done adding");
  }
/*
  Future<void> insertFlag(String flag) async {
    final db = await dataBase;
    await db.rawInsert('INSERT INTO flagsTable(flagName) VALUES($flag)');
  }*/

  Future<void> removeTagWplace(String placeTitle, String tag) async {
    final db = await dataBase;

    final placeid = await returnPlaceID(placeTitle);
    final tagid = await returnTagID(tag);

    //print("Deleting placeID: $placeid, tagID: $tagid");

    await db.delete(
      'placesTagsTable',
      where: "placeID = ? AND tagID = ?",
      whereArgs: [placeid, tagid],
    );
  }

  ///////////////////////////////////////////////////////////////////////////////

  Future<int> returnPlaceID(String place) async {
    final db = await dataBase;
    //get Place ID
    final getPlaceID = await db.query(
      _placesTable,
      columns: ['placeID'],
      where: 'PlaceTitle = ?',
      whereArgs: [place],
      
    );

    final placeID = getPlaceID.first['placeID'] as int;
    return placeID;
  }

  Future<int> returnTagID(String tag) async {
    final db = await dataBase;
    //get Tag ID
    final getTagID = await db.query(
      'tagsTable',
      columns: ['tagID'],
      where: 'tagName = ?',
      whereArgs: [tag],
    );

    final tagID = getTagID.first['tagID'] as int;
    return tagID;
  }

  // will call it back when the user trag a checkbox beside each tag
  Future<void> saveTagWplace(String place, String tag) async {
    final db = await dataBase;

    final placeID = await returnPlaceID(place);
    final tagID = await returnTagID(tag);

    //save place and tag in 'placesTagsTable'
    await db.insert('placesTagsTable', {
      'placeID': placeID,
      'tagID': tagID,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  //will call it back when the user come from the drawer to see the list of places he saved
  Future<List<Map<String, Object?>>> returnPlace(String tag , int offset, int limit) async {
    final db = await dataBase;
    final List<Map<String, Object?>> result = [];

    //get tagID from the tagName//
    final tagQuery = await db.query(
      "tagsTable",
      columns: ['tagID'],
      where: 'tagName= ?',
      whereArgs: [tag],
      limit: limit,
      offset: offset,
    );

    final tagID = tagQuery.first['tagID'] as int;

    //get **all** the placesIDs to this tag name
    final placeIDQuery = await db.query(
      'placesTagsTable',
      columns: ['placeID'],
      where: 'tagID = ?',
      whereArgs: [tagID],
    );

    //convert **each** placeID to place title
    for (final row in placeIDQuery) {
      final placeID = row['placeID'] as int;

      final placeQuery = await db.query(
        _placesTable,
        columns: ['PlaceTitle'],
        where: 'placeID = ?',
        whereArgs: [placeID],
      );

      result.addAll(placeQuery);
    }
    return result;
  }

  Future<bool> checkTagIsExsit(String place, String tag) async {
    final db = await dataBase;

    final Place = await returnPlaceID(place);
    final Tag = await returnTagID(tag);
    //print("Checking placeID: $Place, tagID: $Tag");

    final result = await db.query(
    'placesTagsTable',
    where: "placeID AND tagID = ?",
    whereArgs: [Place, Tag],
  );

  //print("$result //////");

  return result.isNotEmpty;

  }
  //////////////////////////////////////////////////////////////////////////////

  Future<void> printPlacesTable() async {
    final db = await dataBase;
    await db.rawQuery('SELECT * FROM $_placesTable');
  }

  /*Future<void> printPlacesFlagsTable() async {
    final db = await dataBase;
    await db.rawQuery('SELECT * FROM placesFlagsTable');
  }*/

  Future<void> printPlacesTagsTable() async {
    final db = await dataBase;
    final result = await db.rawQuery('SELECT * FROM placesTagsTable');
    //for (final row in result) {
      //print(row); // each row is a Map {placeID: 1, tagID: 2}
    //}
  }

  myDeleteDataBase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, _dbFileName);
    await deleteDatabase(databasePath);
   // print("delete done");
  }
}
