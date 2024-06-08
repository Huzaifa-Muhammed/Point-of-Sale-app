import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../Model/employee_class.dart';

class EmployeeClassDatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'employees.db');

    // Open the database or create if it doesn't exist
    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        // Create the employees table
        return db.execute(
          'CREATE TABLE employees(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT, city TEXT, contact TEXT, role TEXT, access TEXT)',
        );
      },
    );
  }

  // Insert an employee into the database
  Future<int> insertEmployee(Employee employee) async {
    await initializeDatabase();
    return await _database.insert('employees', employee.toMap());
  }

  // Retrieve all employees from the database
  Future<List<Employee>> getAllEmployees() async {
    await initializeDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('employees');
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }

  // Retrieve employees by role from the database
  Future<List<Employee>> getAllEmployeesByRole(String role) async {
    await initializeDatabase();
    final List<Map<String, dynamic>> maps = await _database.query('employees', where: 'role = ?', whereArgs: [role]);
    return List.generate(maps.length, (i) {
      return Employee.fromMap(maps[i]);
    });
  }

  // Update an employee in the database
  Future<int> updateEmployee(Employee employee) async {
    await initializeDatabase();
    return await _database.update(
      'employees',
      employee.toMap(),
      where: 'id = ?',
      whereArgs: [employee.id],
    );
  }

  // Delete an employee from the database
  Future<int> deleteEmployee(int id) async {
    await initializeDatabase();
    return await _database.delete(
      'employees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
