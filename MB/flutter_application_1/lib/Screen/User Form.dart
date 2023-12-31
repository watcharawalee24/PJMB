import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/config.dart';
import 'model/login_result.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

class UserForm extends StatefulWidget {
  static const routeName = '/userform';
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formkey = GlobalKey<FormState>();
  Users user = Users();

  Future<void> addNewUser(Users user) async {
    var url = Uri.http(Configure.server, "users");
    var resp = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    var rs = usersFromJson("[${resp.body}]");

    if (rs.length == 1) {
      Navigator.pop(context, "refresh");
    }
    return;
  }

  Future<void> updateData(Users user) async {
    var url = Uri.http(Configure.server, "users/${user.id}");
    var resp = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    var rs = usersFromJson("[${resp.body}]");

    if (rs.length == 1) {
      Navigator.pop(context, "refresh");
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      user = ModalRoute.of(context)!.settings.arguments as Users;
    } catch (e) {
      user = Users();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New User",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 243, 222, 214),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstNameInputField(),
              lastNameInputField(),
              ageInputField(),
              skintypeInputField(),
              emailInputField(),
              passwordInputField(),
              addressInputField(),

              SizedBox(
                height: 10,
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstNameInputField() {
    return TextFormField(
      initialValue: user.firstName,
      decoration: InputDecoration(
        labelText: "Firstname",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.firstName = newValue!,
    );
  }

  Widget lastNameInputField() {
    return TextFormField(
      initialValue: user.lastName,
      decoration: InputDecoration(
        labelText: "Lastname",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.lastName = newValue!,
    );
  }

  Widget ageInputField() {
    return TextFormField(
      initialValue: user.age != null ? user.age.toString() : null,
      decoration: InputDecoration(
        labelText: "Age",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.age = int.parse(newValue!),
    );
  }

  Widget skintypeInputField() {
    return TextFormField(
      initialValue: user.skintype,
      decoration: InputDecoration(
        labelText: "Skin Type",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.skintype = newValue!,
    );
  }

  Widget emailInputField() {
    return TextFormField(
      initialValue: user.email,
      decoration: InputDecoration(
        labelText: "Email:",
        icon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        if (!EmailValidator.validate(value)) {
          return "It is not an email format";
        }
        return null;
      },
      onSaved: (newValue) => user.email = newValue,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      initialValue: user.password,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        icon: Icon(Icons.lock),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.password = newValue,
    );
  }

  Widget addressInputField() {
    return TextFormField(
      initialValue: user.address,
      decoration: InputDecoration(
        labelText: "Address",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      onSaved: (newValue) => user.address = newValue!,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          print(user.toJson().toString());
          if (user.id == null) {
            addNewUser(user);
          } else {
            updateData(user);
          }
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.brown),
      ),
      child: Text("Save"),
    );
  }
}
