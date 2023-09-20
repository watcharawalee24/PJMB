import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Edit.dart';
import 'items_widget.dart';
import 'items_widget2.dart';
import 'items_widget3.dart';
import 'items_widget4.dart';


class OilySkin extends StatefulWidget {
  static const routeName = '/oilyskin';

  const OilySkin({Key? key}) : super(key: key);

  @override
  State<OilySkin> createState() => _OilySkinState();
}

class _OilySkinState extends State<OilySkin> {
  int _cartItemCount = 0; 

  void handleLogout(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/');
  }

  void editProfile(BuildContext context) {
    Navigator.pushNamed(context, Edit.routeName);
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
            leading: Icon(Icons.person),
            title: Text('แก้ไขข้อมูลผู้ใช้'),
          ),
          onTap: () {
           Navigator.of(context).pushReplacementNamed('/edit');
  
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
                  message: 'ตระกร้าสินค้า',
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: const Color.fromARGB(255, 81, 74, 74),
                        size: 36.0,
                      ),
                      if (_cartItemCount > 0) 
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 77, 59, 56), 
                            ),
                            child: Text(
                              _cartItemCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.routeName);
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
                    fontSize: 20,
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
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      labelColor:
                          Colors.brown, // เปลี่ยนสีของข้อความเมื่อถูกเลือก
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor:
                          Colors.brown, // เปลี่ยนสีของข้อความที่ไม่ถูกเลือก
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(
                          child: Text(
                            "cleansing",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "moisturizer",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "sunscreen",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "serum",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ItemsWidget(),
                          moisturizer(),
                          sunscreen(),
                          serum(),
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
