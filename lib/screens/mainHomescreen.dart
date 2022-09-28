import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class mainHomescreen extends StatelessWidget {
  const mainHomescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('หน้าที่3')),
      body: Container(
        child: Image.asset('assets/Hos.png'),
      ),
    );
  }
}
//ใส่รูปเข้าไปแสดงผล
