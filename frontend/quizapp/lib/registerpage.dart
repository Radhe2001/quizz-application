// import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'constants/urls.dart';
// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'loginpage.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController registration = TextEditingController();
  TextEditingController password = TextEditingController();

  void createToast() async {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  void move() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
    // createToast();
  }

  void register() async {
    try {
      var data = {
        "name": name.text.toString(),
        "email": email.text.toString(),
        "registrationId": registration.text.toString(),
        "password": password.text.toString(),
      };
      http.Response response = await http.post(
        Uri.parse(userApi),
        body: data,
        headers: {
          "ContentType": "Application/json",
        },
      );
      name.clear();
      email.clear();
      password.clear();
      registration.clear();
      createToast();
      print(response.body);
      move();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
        backgroundColor: Colors.red[200],
      ),
      body: Container(
        color: Colors.pink[800],
        child: Center(
          child: Container(
            height: 330,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              border: Border.all(width: 5, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your Registration",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: registration,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: email,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: password,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: login,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: register,
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
