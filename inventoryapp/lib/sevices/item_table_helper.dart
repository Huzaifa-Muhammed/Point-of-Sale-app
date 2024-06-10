import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import '../../../../Model/item_class.dart';

class ItemClassDatabaseHelper {
  static final ItemClassDatabaseHelper _instance = ItemClassDatabaseHelper._internal();
  factory ItemClassDatabaseHelper() => _instance;
  static Database? _database;

  ItemClassDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'inventory.db');
    return await databaseFactoryFfi.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
      ),
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        category TEXT,
        price TEXT,
        margin TEXT,
        quantity TEXT
      )
    ''');
  }

  Future<int> insertItem(Item item) async {
    Database db = await database;
    return await db.insert('items', item.toMap());
  }

  Future<List<Item>> getItems() async {
    Database db = await database;
    var items = await db.query('items', orderBy: 'id');
    List<Item> itemList = items.isNotEmpty ? items.map((c) => Item.fromMap(c)).toList() : [];
    return itemList;
  }

  Future<void> deleteItem(int id) async {
    final db = await database;
    await db.delete(
      'items', // Table name
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
