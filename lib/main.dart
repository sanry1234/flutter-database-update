import 'package:ap/screens/home_screen.dart';
import 'package:ap/screens/mainHomescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ap/models/Tarnsections.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'providers/tarnsection_provider.dart';
import 'package:ap/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';

//แสดงผลแอพในตอนเริ่มต้น
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TarnsectionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Color.fromARGB(255, 231, 233, 235),
        ),
        home: const MyHomePage(title: 'แอพกรอกข้อมูล'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //get title => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //เพิ่มช่องเมนูด้านล่าง
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 111, 183, 241),
        body: TabBarView(
          children: [
            mainHomescreen(),
            HomeScreen(),
          ], //ตําแหน่งใสหน้าข้อมูล
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'หน้าหลัก',
            ),
            Tab(
              icon: Icon(Icons.add),
              text: 'เพิ่มรายการ',
            ),
          ],
          labelStyle: GoogleFonts.kanit(),
        ),
      ),
    );

    //length = ระบุหน้าเมนู
    //child = สร้างเมนู
  }
}
