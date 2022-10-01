import 'package:ap/main.dart';
import 'package:ap/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ap/models/Tarnsections.dart';
import 'package:ap/providers/tarnsection_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
//const FormScreen({Key? key}) : super(key: key);
//Controller

  TextEditingController mmHgController = TextEditingController();
  TextEditingController kgController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController numberphoneController = TextEditingController();
  TextEditingController cmController = TextEditingController();
  TextEditingController titleController = TextEditingController(); //รับค่าชื่อ
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController(); //รับค่าเลข

  get editingController => null; //กรอกข้อมูล

  // final dateController = TextEditingController(); //รับค่าเวลาวันที่

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "แบบฟรอมกรอกข้อมูล",
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(),
        ),
      ),
      body: Form(
        child: Column(
          key: formKey,
          children: [
            Container(height: 20),
            //ชื่อสกุล
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: new InputDecoration(
                labelText: "ชื่อ - สกุล",
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.people),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            //อายุ
            TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: new InputDecoration(
                labelText: "อายุ",
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.people),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            // เบอร์โทร
            TextField(
              keyboardType: TextInputType.number,
              controller: numberphoneController,
              decoration: new InputDecoration(
                labelText: "เบอร์โทร",
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.phone_android),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: cmController,
              decoration: new InputDecoration(
                labelText: "ส่วนสูง",
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.man),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: kgController,
              decoration: new InputDecoration(
                labelText: "นํ้าหนัก",
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.accessibility_new_sharp),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              controller: mmHgController,
              decoration: new InputDecoration(
                labelText: 'ความดันโลหิต',
                labelStyle: GoogleFonts.kanit(),
                prefixIcon: Icon(Icons.monitor_heart_sharp),
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
              ),
            ),
            Container(height: 20),
            // ปุ่มเพิ่มข้อมูล
            TextButton(
              child: Text(
                'เพิ่มข้อมูล',
                style: GoogleFonts.kanit(
                    textStyle: TextStyle(color: Colors.white, fontSize: 15)),
                //  style:  TextStyle(color: Colors.white, fontSize: 15),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green[400]),
              onPressed: () {
                //cm, numberphone, age, kg, mmHg;
                var title = titleController.text;
                var cm = cmController.text;
                var numberphone = numberphoneController.text;
                var age = ageController.text;
                var kg = kgController.text;
                var mmHg = mmHgController.text;
                var amount = amountController.text;
                var name = nameController.text;
                print(title);
                print(amount);
                print(timeDilation);

//เตรียมข้อมูล
                Transections statement = Transections(
                    cm: cm,
                    numberphone: numberphone,
                    age: age,
                    kg: kg,
                    mmHg: mmHg,
                    title: title,
                    date: DateTime.now()); //object
//เรียก provider
                TarnsectionProvider provider =
                    Provider.of<TarnsectionProvider>(context, listen: false);
                provider.addTarnsection(statement);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return HomeScreen();
                        }));
              },
            ),
          ],
        ),
      ),
    );
  }

//ปรับแต่ง  myinputborder
  OutlineInputBorder myinputborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.blueAccent,
          width: 3,
        ));
  }

//ปรับแต่ง myfocusborder
  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(500)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 99, 194, 80),
          width: 3,
        ));
  }
}
