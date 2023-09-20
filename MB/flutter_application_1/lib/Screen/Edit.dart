import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Cosmeceuticals.dart';
import 'package:http/http.dart' as http;
import 'model/config.dart';
import 'model/login_result.dart';
import 'User Form.dart';
import 'User Info.dart';


class Edit extends StatefulWidget {
  static const routeName = '/edit';
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String loggedInUser = 'Puttaraporn Prasansang';
  Widget mainBody = Container();
  List<Users> _userList = [];

  Future<void> getUsers() async {
    var url = Uri.http(Configure.server, "users");
    var resp = await http.get(url);
    setState(() {
      _userList = usersFromJson(resp.body);
      mainBody = showUsers(context); // แก้เพื่อให้เรียก showUsers พร้อม context
    });
    return;
  }

  Future<void> removeUsers(user) async {
    var url = Uri.http(Configure.server, "users/${user.id}");
    var resp = await http.delete(url);
    print(resp.body);
    return;
  }

  void handleLogout(BuildContext context) {
  Navigator.of(context).pop();
}

  void openHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(COSMECEUTICALS.routeName);
  }
   void editProfile(BuildContext context) {
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
  void initState() {
    super.initState();
    Users user = Configure.login;
    if (user.id != null) {
      getUsers();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit",
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
          GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              
              // เพิ่ม CosmeticsBox อื่นๆ ที่คุณต้องการ
            ],
          ),
          mainBody, // ใช้ mainBody ใน Stack
        ],
      ),
      backgroundColor: Color.fromARGB(255, 243, 222, 214) ,
    
    );
  }

  // เพิ่ม showUsers ใน _COSMECEUTICALSState
  Widget showUsers(BuildContext context) {
    return ListView.builder(
      itemCount: _userList.length,
      itemBuilder: (context, index) {
        Users user = _userList[index];
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          child: Card(
            child: ListTile(
              title: Text("${user.firstName}",),
              subtitle: Text("${user.email}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfo(),
                    settings: RouteSettings(arguments: user),
                  ),
                );
              },
              trailing: IconButton(
                onPressed: () async {
                  String result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserForm(),
                      settings: RouteSettings(arguments: user),
                    ),
                  );
                  if (result == "refresh") {
                    getUsers();
                  }
                },
                icon: Icon(Icons.edit,color: Colors.brown,),
              ),
            ),
          ),
          onDismissed: (direction) {
            removeUsers(user);
          },
          background: Container(
            color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        );
      },
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
