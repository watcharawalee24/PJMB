import 'package:flutter/material.dart';
import 'items_widget.dart';

class OilySkin extends StatefulWidget {
  static const routeName = '/oilyskin';

  const OilySkin({Key? key}) : super(key: key);

  @override
  State<OilySkin> createState() => _OilySkinState();
}

class _OilySkinState extends State<OilySkin> with SingleTickerProviderStateMixin {
  String loggedInUser = 'Puttaraporn Prasansang';
 
  
  void handleLogout(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/');
  }

  void showLeftMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10, 50, 0, 0),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            // ใส่โค้ดเมื่อกดปุ่ม 'หน้าหลัก'
          },
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('ออกจากระบบ'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            handleLogout(context);
          },
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('แก้ไขข้อมูลผู้ใช้'),
          ),
          onTap: () {
            Navigator.of(context).pop();
            handleLogout(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Oily Skin",
            style: TextStyle(
              color: Colors.brown,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              IconButton(
                icon: Tooltip(
                  message: '',
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 36.0,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('ข้อมูลผู้ใช้'),
                        content: Center(child: Text('คุณ $loggedInUser ใช้งานอยู่')),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ปิด'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.sort_rounded,
            color: Color.fromARGB(255, 35, 2, 2),
            size: 50.0,
          ),
          onPressed: () {
            showLeftMenu(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(146, 255, 255, 255),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Color.fromARGB(64, 82, 72, 72),
                  width: 2.0,
                ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ค้นหาเวชสำอางค์',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(160, 77, 51, 51),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 6,
                child: Column(
                  children: [
                    TabBar(
                     
                      labelColor: Colors.brown, // เปลี่ยนสีของข้อความเมื่อถูกเลือก
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.brown, // เปลี่ยนสีของข้อความที่ไม่ถูกเลือก
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      // เพิ่ม TabBar ที่นี่
                      tabs: [
                        Tab(
                          child: Text(
                            "cleansing",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "moisturizer",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "sunscreen",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "serum",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "serum",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "serum",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ItemsWidget(),
                          ItemsWidget(),
                          ItemsWidget(),
                          ItemsWidget(),
                          ItemsWidget(),
                          ItemsWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
