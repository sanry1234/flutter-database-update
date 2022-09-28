import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../models/Tarnsections.dart';

class TarnsectionDB {
  //บริการเกี่ยวกับฐานข้อมูล

  String dbName; //เก็บชื่อฐานข้อมูล
  // ถ้ายังไม่ถูกสร้าง => สร้าง
  // ถูกสร้างไว้แล้ว => เปิด
  TarnsectionDB({required this.dbName});

  // หาตําแหน่ง user

  Future<Database> openDatabase() async {
    //หาตําแหน่งที่จัดเก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  Future<int> InsertData(Transections statement) async {
    //ฐานข้อมูล => Store
    // tarnsaction.db => expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    // json
    var keyID = store.add(db, {
      "title": statement.title,
      "cm": statement.cm,
      "numberphone": statement.numberphone,
      "age": statement.age,
      "kg": statement.kg,
      "mmHg": statement.mmHg,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyID;
  }

//ดึงข้อมูล
// ใหม่ => เก่า false มาก => น้อย
// เก่า => เก่า true น้อย => มาก
  Future<List<Transections>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    var transactionList = <Transections>[];
    for (var record in snapshot) {
      transactionList.add(Transections(
          title: record["title"] as String,
          date: DateTime.parse(record["date"] as String),
          cm: record["cm"] as String,
          numberphone: record["numberphone"] as String,
          age: record["age"] as String,
          kg: record["kg"] as String,
          mmHg: record["mmHg"] as String));
    }
    return transactionList;
  }
}
