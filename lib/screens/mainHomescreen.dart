import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainHomescreen extends StatelessWidget {
  const mainHomescreen({super.key});

  get editingController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'หน้าที่ 3',
          textAlign: TextAlign.center,
          style: GoogleFonts.kanit(),
        ),
      ),
      //ตัวค้นหา
      body: Container(
        child: TextField(
          controller: editingController,
          decoration: InputDecoration(
            labelText: "ค้นหา",
            hintText: "โปรดป้อนข้อมูลของท่าน",
            labelStyle: GoogleFonts.kanit(),
            hintStyle: GoogleFonts.kanit(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
//ใส่รูปเข้าไปแสดงผล
