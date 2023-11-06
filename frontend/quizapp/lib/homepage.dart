import 'package:flutter/material.dart';
import 'constants/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/subjectmodel.dart';
import 'questionpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Subject> subjectList = [];
  bool isLoading = true;
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(subjectApi));
      var data = json.decode(response.body);
      data.forEach((e) {
        String id = e['id'].toString();
        String name = e['subjectName'];
        var obj = Subject(id: id, subjectName: name);
        subjectList.add(obj);
      });

      setState(() {
        isLoading = false;
      });
      subjectList.forEach((element) {
        print(element.subjectName);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void startTest(String rid) {
    Navigator.push(context, MaterialPageRoute(builder: (builder)=>QuestionPage(rid: rid)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qizz App"),
        backgroundColor: Colors.red[200],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: subjectList.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      startTest(e.id);
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.teal[800],
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Center(
                        child: Text(
                          e.subjectName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
