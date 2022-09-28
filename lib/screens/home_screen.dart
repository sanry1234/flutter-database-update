import 'package:ap/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/Tarnsections.dart';
import '../providers/tarnsection_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TarnsectionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แอพของฉัน"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                SystemNavigator.pop();
              })
        ],
      ),
      body: Consumer(
        builder: (context, TarnsectionProvider provider, child) {
          var count = provider.transections.length; //นับจํานวนข้อมูล
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่พบข้อมูลโปรดป้อนข้อมูลของท่าน",
                style: GoogleFonts.kanit(fontSize: 15),
                //const TextStyle(fontSize: 15)
              ),
            );
          } else {
            return ListView.builder(
              //อ่านกล่องตาม TarnsectionProvider
              itemCount: count,
              itemBuilder: (context, int index) {
                Transections data = provider.transections[index];
                return Card(
                  elevation: 60,
                  color: Color.fromARGB(255, 63, 160, 206),
                  margin: EdgeInsets.all(9.5),
                  //กําหนดเงา
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.woolha.com/media/2020/03/eevee.png'),
                            radius: 20,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('  ชื่อ-นามสกุล :  ',
                                  style: GoogleFonts.kanit()),
                              Text(
                                data.title,
                                style: GoogleFonts.kanit(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  อายุ :  ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                data.age,
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                ' ปี ',
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  เบอร์โทรศัพท์ : ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                data.numberphone,
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ส่วนสูง :  ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                data.cm,
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                ' cm ',
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  นํ้าหนัก :  ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                data.kg,
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                ' cm ',
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ความดันโลหิต :  ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                data.mmHg,
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                ' mmHg ',
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '  ถูกบันทึกระบบเมื่อ:  ',
                                style: GoogleFonts.kanit(),
                              ),
                              Text(
                                DateFormat("dd/MM/yyyy").format(data.date),
                                style: GoogleFonts.kanit(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                'ไปที่หน้าหลัก',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(),
                strutStyle: StrutStyle(
                  height: 0.5,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text(
                'หน้าที่ 1 ',
                style: GoogleFonts.kanit(),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: Text(
                'หน้าที่ 2 ',
                style: GoogleFonts.kanit(),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: Text(
                'หน้าที่ 3 ',
                style: GoogleFonts.kanit(),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: Text(
                'หน้าที่ 4 ',
                style: GoogleFonts.kanit(),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
