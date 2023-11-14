import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants/urls.dart';
import 'homepage.dart';
import 'registerpage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> passwordList = [];
  bool isLoading = true;
  TextEditingController registration = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => HomePage()));
  }

  void register(){
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => RegisterUser()));
  }

  void fetchData() async {
    try {
      var api = userApi + registration.text + "/";
      http.Response response = await http.get(Uri.parse(api));
      var obj = json.decode(response.body);
      obj.forEach((element) {
        String pass = element['password'];
        passwordList.add(pass);
      });
      print("working fine");

      setState(() {
        isLoading = false;
      });
      passwordList.forEach((element) {
        if (element == password.text.toString()) {
          print("password matched");
          
          registration.clear();
          password.clear();
          login();

        } else {
          print("Password didn't match");
          registration.clear();
          password.clear();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 50),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter your Registration No.",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: registration,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    controller: password,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: register,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: fetchData,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
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
