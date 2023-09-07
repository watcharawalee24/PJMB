import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/Cosmeceuticals.dart';
import 'package:flutter_application_1/model/config.dart';
import 'package:flutter_application_1/model/login_result.dart';
import 'package:http/http.dart' as http;



class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Users user = Users();

  Future<void> login(Users user) async {
    var params = {"email": user.email, "password": user.password};

    var url = Uri.http(Configure.server, "users", params);
    var resp = await http.get(url);
    print(resp.body);
    List<Users> loginResult = usersFromJson(resp.body);
    print(loginResult.length);
    if (loginResult.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username or password invalid")),
      );
    } else {
      Configure.login = loginResult[0];
      // เมื่อ Login สำเร็จ ให้เรียกเปลี่ยนหน้าไปยัง COSMECEUTICALS
      Navigator.pushNamed(context, COSMECEUTICALS.routeName);
    }
    return;
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
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/564x/80/45/31/8045315ab07b3edfd781fff6806215ee.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 300.0,
              height: 400.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(84, 249, 249, 249).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://cdn.icon-icons.com/icons2/1993/PNG/512/account_avatar_face_man_people_profile_user_icon_123197.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 15.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          emailInputField(),
                          SizedBox(height: 20.0),
                          passwordInputField(),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              submitButton(),
                              SizedBox(width: 10.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailInputField() {
    return TextFormField(
      initialValue: "a@test.com",
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
      onSaved: (newValue) => user.email = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      initialValue: "64110570",
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      onSaved: (newValue) => user.password = newValue!,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          login(user);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,  
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 12.0,
        ),
        textStyle: TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
      ),
      child: Text('Login'),
    );
  }

  Widget backButton() {
    return ElevatedButton(
      onPressed: () {
        // สร้างการนำทางกลับไปยังหน้าก่อนหน้านี้
        Navigator.pop(context);
      },
      child: Text('Back'),
    );
  }
}
