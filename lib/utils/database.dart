import 'package:baratonchurch/utils/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StudentDatabase {
  static final StudentDatabase instance = StudentDatabase._init();
  static Database? _database;
  StudentDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student_details');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(
    Database db,
    int version,
  ) async {
    const textType = 'TEXT NOT NULL';
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    await db.execute('''
    CREATE TABLE $tableStudent(
      ${StudentFields.id} $idType,
      ${StudentFields.studentId} $textType,
      ${StudentFields.firstName} $textType,
      ${StudentFields.middleName} $textType,
      ${StudentFields.lastName} $textType,
    )
    ''');
  }

  Future<Student> create(Student student) async {
    final db = await instance.database;
    final id = await db.insert(tableStudent, student.toJson());
    return student.copy(id: id);
  }

  Future<Student> readStudentInfo(int id) async {
    final db = await instance.database;
    final maps = await db.query(tableStudent,
        columns: StudentFields.values,
        where: '${StudentFields.id} =? ',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Student.fromJson(maps.first);
    } else {
      print("!!!!!! something went wrong in the database ..my comment");
      throw Exception('ID $id not found ..my exception');
    }
  }

  Future<int> update(Student student) async {
    final db = await instance.database;
    return db.update(tableStudent, student.toJson(),
        where: '${StudentFields.id}= ? ', whereArgs: [student.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db
        .delete(tableStudent, where: '${StudentFields.id}= ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
