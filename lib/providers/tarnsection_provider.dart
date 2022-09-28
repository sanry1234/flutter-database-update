import 'package:ap/database/tarnsection_db.dart';
import 'package:ap/models/Tarnsections.dart';
import 'package:flutter/foundation.dart';

class TarnsectionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transections> transections = [];

//ดึงข้อมูล
  List<Transections> getTarnsection() {
    return transections;
  }

  void initData() async {
    var db = TarnsectionDB(dbName: "transactions.db");
    //ดึงข้อมูลออกมาแสดงผล
    transections = await db.loadAllData();
    notifyListeners();
  }

  void addTarnsection(Transections statement) async {
    var db = TarnsectionDB(dbName: "transactions.db");
    //บันทึกข้อมูล
    await db.InsertData(statement);
    //ดึงข้อมูลออกมาแสดงผล
    transections = await db.loadAllData();
    //แจ้งเตือน cosumer
    notifyListeners();
  }
}
