import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/login_result.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  
 

  @override
  Widget build(BuildContext context) {
     Users user = ModalRoute.of(context)!.settings.arguments as Users;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          child: ListView(
            children: [
             ListTile(title: Text("First name"),subtitle: Text("${user.firstName}"),),
             ListTile(title: Text("Last name"),subtitle: Text("${user.lastName}"),),
             ListTile(title: Text("Age"),subtitle: Text("${user.age}"),),
             ListTile(title: Text("Skin Type"),subtitle: Text("${user.skintype}"),),   
             ListTile(title: Text("Email"),subtitle: Text("${user.email}"),),
             ListTile(title: Text("Password"),subtitle: Text("${user.password}"),),
             ListTile(title: Text("Address"),subtitle: Text("${user.address}"),),
            
              
          

            ],
          ),
        ),
      ),
    );
  }
}