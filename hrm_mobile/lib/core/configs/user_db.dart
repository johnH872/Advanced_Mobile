import 'package:hrm_mobile/core/configs/database_service.dart';
import 'package:hrm_mobile/modules/shared/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDB {
  final tableName = "users";

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" STRING NOT NULL,
      "firstName" STRING NOT NULL,
      "middleName" STRING NOT NULL,
      "lastName" STRING NOT NULL,
      "role" STRING NOT NULL
    );""");
  }

  // Future<int> create({required String title}) async {
  //   final database = await DatabaseService().database;
  //   return await database.rawInsert(
  //     '''INSERT INTO
  //   );
  // }
  Future<UserModel> fetchById(String id) async {
    final database = await DatabaseService().database;
    var user = await database.rawQuery('''SELECT * from $tableName WHERE id = ?''', [id]);
    if(user.firstOrNull == null) {
      user = await database.rawQuery('''INSERT into $tableName values(?,?,?,?,?)''', ['User1', 'Adam', 'D', 'John', 'HR Manager']);
      user = await database.rawQuery('''SELECT * from $tableName WHERE id = ?''', [id]);
    }
    return UserModel.fromSqfliteDatabase(user.first);
  }

}