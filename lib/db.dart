import 'package:sqflite/sqflite.dart'as sql;
import 'package:path/path.dart'as path;
class DbExpenseBook{
  static Future<sql.Database> database() async{
    final dbPath = await sql.getDatabasesPath();
    return  await sql.openDatabase(path.join(dbPath, 'qarzdaftar'),
        onCreate: (db,version){
          return db.execute('CREATE TABLE debtor_user(id TEXT PRIMARY KEY,name TEXT,phonenumber TEXT,koment TEXT, summ INT,datetime TIME)');
        },
        version: 1
    );
  }
  static Future<void> insert(String debtoruser, Map<String,dynamic> data) async{
  final sqlDb  =await DbExpenseBook.database();
  sqlDb.insert(debtoruser, data,conflictAlgorithm: sql.ConflictAlgorithm.replace,);
  }

  static Future<List<Map<String,dynamic>>> getdata(String debtoruser) async{
    final sqlDb = await DbExpenseBook.database();
    return sqlDb.query(debtoruser);
  }
}