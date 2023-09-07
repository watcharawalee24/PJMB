import 'package:flutter/material.dart';
import 'User Form.dart';
import 'chat.dart';
import 'Oily Skin.dart';

class COSMECEUTICALS extends StatefulWidget {
  static const routeName = '/cosmeceuticals';
  const COSMECEUTICALS({Key? key}) : super(key: key);

  @override
  State<COSMECEUTICALS> createState() => _COSMECEUTICALSState();
}

class _COSMECEUTICALSState extends State<COSMECEUTICALS> {
  String loggedInUser =
      'Puttaraporn Prasansang'; // เปลี่ยนเป็นชื่อผู้ที่ล็อกอินจริง

  void handleLogout(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  void openHome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => COSMECEUTICALS(),
      ),
    );
  }

  void editProfile(BuildContext context) {
     Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserForm(),
      ),
    );
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
            Navigator.pushNamed(context, UserForm.routeName);
            editProfile(context);
          },
        ),
      ],
    );
  }

  void onTapCosmeticsBox(String title, BuildContext context) {
    if (title == "ผิวมัน") {
      Navigator.pushNamed(context, OilySkin.routeName);
    } else {
      // ใส่โค้ดอื่นๆ สำหรับ CosmeticsBox ที่ title ไม่ใช่ "ผิวมัน" ที่นี่
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "COSMECEUTICALS",
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
              IconButton(
                icon: Tooltip(
                  message: 'แสดงข้อมูลผู้ที่ล็อกอิน',
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
                        content: Text('คุณ $loggedInUser ใช้งานอยู่'),
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
            Icons.menu,
            color: Color.fromARGB(255, 35, 2, 2),
            size: 40.0,
          ),
          onPressed: () {
            showLeftMenu(context);
          },
        ),
      ),
      body: Stack(
        children: [
          GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              CosmeticsBox(
                title: "ผิวมัน",
                image:
                    "https://i.pinimg.com/474x/e7/9c/83/e79c83345325c8169c9755b1a1299018.jpg",
                onTap: () {
                  onTapCosmeticsBox("ผิวมัน", context);
                },
              ),
              CosmeticsBox(
                title: "ผิวผสม",
                image:
                    "https://i.pinimg.com/564x/04/e9/42/04e9428fdc68c1781ded170dc27afe4a.jpg",
                onTap: () {},
              ),
              CosmeticsBox(
                title: "ผิวแห้ง",
                image:
                    "https://i.pinimg.com/564x/84/53/76/8453761424031c86d6274e353fbc3485.jpg",
                onTap: () {},
              ),
              CosmeticsBox(
                title: "ผิวแพ้ง่าย",
                image:
                    "https://i.pinimg.com/564x/ff/6b/7b/ff6b7b31c4f3c44e2ee99353875427b5.jpg",
                onTap: () {},
              ),
              // เพิ่ม CosmeticsBox อื่นๆ ที่คุณต้องการ
            ],
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: SizedBox(
            width: 70.0,
            height: 70.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Icon(Icons.chat),
            ),
          ),
        ),
      ),
    );
  }
}

class CosmeticsBox extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  CosmeticsBox({required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
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
