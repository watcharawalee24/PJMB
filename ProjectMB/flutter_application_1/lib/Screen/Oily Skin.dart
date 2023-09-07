import 'package:flutter/material.dart';
import 'Cosmeceuticals.dart';
// ตรงชื่อไฟล์ของคลาส COSMECEUTICALS ที่คุณสร้างไว้
import 'User Form.dart';

class OilySkin extends StatefulWidget {
  static const routeName = '/oilyskin';
  const OilySkin({Key? key}) : super(key: key);

  @override
  State<OilySkin> createState() => _OilySkinState();
}

class _OilySkinState extends State<OilySkin> {
  void handleLogout(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/');
  }

  void openHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(COSMECEUTICALS.routeName);
  }
   void editProfile(BuildContext context) {
  Navigator.of(context).pushNamed(UserForm.routeName);
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
            openHome(context);
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
          title: Text('แก้ไขข้อมูล'),
        ),
       onTap: () {
            Navigator.of(context).pop();
            editProfile(context);
          },
      ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oily Skin",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 36.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color.fromARGB(255, 35, 2, 2),
            size: 40.0,
          ),
          onPressed: () {
            showLeftMenu(context);
          },
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          String menuItemTitle;
          if (index == 0) {
            menuItemTitle = "Cleansing";
          } else if (index == 1) {
            menuItemTitle = "Moisturising";
          } else if (index == 2) {
            menuItemTitle = "Sunscreen";
          } else {
            menuItemTitle = "Serum";
          }
          return OilySkinMenuItem(title: menuItemTitle);
        },
      ),
    );
  }
}

class OilySkinMenuItem extends StatelessWidget {
  final String title;

  OilySkinMenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // เพิ่มการแสดงผลหรือการนำทางเมื่อคลิกที่เมนูย่อย
        // ตัวอย่าง: สามารถเปิดหน้าใหม่หรือทำอื่น ๆ ตามความต้องการ
        Navigator.of(context).pushReplacementNamed('/new_page');
      },
      child: Card(
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
