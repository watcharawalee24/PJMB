import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Add.dart';
import 'package:flutter_application_1/Screen/Cosmeceuticals.dart';
import 'package:flutter_application_1/Screen/Edit.dart';
import 'package:flutter_application_1/Screen/Login.dart';
import 'package:flutter_application_1/Screen/Oily%20Skin.dart';
//import 'package:flutter_application_1/Screen/Recommend.dart';
import 'package:flutter_application_1/Screen/chat.dart';
import 'Screen/Begin.dart';
import 'Screen/User Form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) =>  Begin(),
        '/login': (context) => const Login(),
        '/cosmeceuticals':(context) => const COSMECEUTICALS(),
        '/userform':(context) => UserForm(),
        '/chat':(context) => ChatScreen(),
        '/oilyskin':(context) => OilySkin(),
        '/edit':(context) => Edit(),
        '/add':(context) => Add(),
        
      
      },
    );
  }
}


