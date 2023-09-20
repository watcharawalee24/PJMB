import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Edit.dart';
import 'chat.dart';
import 'Oily Skin.dart';

class COSMECEUTICALS extends StatefulWidget {
  static const routeName = '/cosmeceuticals';

  const COSMECEUTICALS({Key? key}) : super(key: key);

  @override
  State<COSMECEUTICALS> createState() => _COSMECEUTICALSState();
}

class _COSMECEUTICALSState extends State<COSMECEUTICALS> {
  String loggedInUser = '';

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

  void edituser(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Edit(),
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
            Navigator.pushNamed(context, Edit.routeName);
            edituser(context);
          },
        ),
      ],
    );
  }

  void onTapCosmeticsBox(String title, BuildContext context) {
    if (title == "ผิวมัน") {
      Navigator.pushNamed(context, OilySkin.routeName);
    } else {
      // Handle other CosmeticsBox categories here.
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
            Icons.sort_rounded,
            color: Color.fromARGB(255, 35, 2, 2),
            size: 50.0,
          ),
          onPressed: () {
            showLeftMenu(context);
          },
        ),
      ),
body: Stack(
  children: [
    // Background Image
   Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: NetworkImage(
        'https://i.pinimg.com/564x/ad/13/e9/ad13e949641dd3151d3fb361d9fe5e2a.jpg',
      ),
      fit: BoxFit.cover,
    ),
  ),
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3), 
    child: Container(
      color: Colors.black.withOpacity(0), // สีพื้นหลังที่ใช้กับ BackdropFilter
    ),
  ),
),
     
    Positioned(
  child: FractionalTranslation(
    translation: Offset(0.2, 1.4), 
    child: Container(
      padding: EdgeInsets.all(16.0), 
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        "YOUR SKIN TYPE ?",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
),

    
    GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Align(alignment: Alignment.bottomCenter),
        Align(alignment: Alignment.bottomCenter),
        CosmeticsBox(
          
          title: "ผิวมัน",
          image:
              "https://i.pinimg.com/564x/17/ec/25/17ec25921f67afbc089a5ef0b9de005d.jpg",
          
          onTap: () {
            onTapCosmeticsBox("ผิวมัน", context);
          },
        ),
        CosmeticsBox(
          title: "ผิวผสม",
          image:
              "https://i.pinimg.com/564x/44/07/d9/4407d9e25da4306e89ea5462ff3f7916.jpg",
          onTap: () {},
        ),
        CosmeticsBox(
          title: "ผิวแห้ง",
          image:
              "https://i.pinimg.com/564x/2a/4d/59/2a4d596a1f8b942cbea22d4c946dbf97.jpg",
          onTap: () {},
        ),
        CosmeticsBox(
          title: "ผิวแพ้ง่าย",
          image:
              "https://i.pinimg.com/564x/c4/5d/52/c45d528f75138d04b06aefb50f59d34d.jpg",
          onTap: () {},
        ),
        // Add other CosmeticsBox categories as needed
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              backgroundColor: Colors.brown,
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

  CosmeticsBox({
    required this.title,
    required this.image,
    required this.onTap,
  });

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
                  fontSize:18.00,
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
