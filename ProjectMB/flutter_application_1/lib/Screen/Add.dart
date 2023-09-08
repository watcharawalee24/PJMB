import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Cosmeceuticals.dart';
import 'package:http/http.dart' as http;
import '../model/config.dart';
import '../model/login_result.dart';
import 'User Form.dart';
import 'User Info.dart';


class Add extends StatefulWidget {
  static const routeName = '/add';
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String loggedInUser = 'Puttaraporn Prasansang';
  Widget mainBody = Container();
  List<Users> _userList = [];

  Future<void> addNewUser(user) async{
    var url = Uri.http(Configure.server,"users");
    var resp = await http.post(url,
    headers: <String,String>{
      'Content-Type':'application/json; charset=UTF-8'
    },
    body: jsonEncode(user.toJson()));
    var rs = usersFromJson("[${resp.body}]");
     
    if (rs.length == 1){
      Navigator.pop(context);
    }
    return;
  }

   Future<void> updateData(user) async {
    var url = Uri.http(Configure.server, "users/${user.id}");
    var resp = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()));
    var rs = usersFromJson("[${resp.body}]");

    if (rs.length == 1) {
      Navigator.pop(context, "refresh");
    }
  }

  void handleLogout(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/login');
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
          "Add new user",
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
      backgroundColor:Color.fromARGB(255, 222, 174, 157) ,
    floatingActionButton: FloatingActionButton(onPressed:(){

    },
    child: const Icon(Icons.person_add_alt_1),backgroundColor: Colors.brown ),
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
              
            ),
          ),
          
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



