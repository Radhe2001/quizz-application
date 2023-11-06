import 'package:flutter/material.dart';
import 'package:quizapp/models/questionmodel.dart';
import 'constants/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'resultpage.dart';

class QuestionPage extends StatefulWidget {
  final String rid;
  QuestionPage({
    required this.rid,
  });
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  PageController controller = PageController(initialPage: 0);
  List<Question> questionList = [];
  bool isLoading = true;
  Color? oc1 = Colors.teal[300];
  Color? oc2 = Colors.teal[300];
  Color? oc3 = Colors.teal[300];
  Color? oc4 = Colors.teal[300];
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int choosenOption = 0;
  String buttonText = "Next";

  void fetchData() async {
    try {
      var api = subjectApi + widget.rid + questionApi;
      http.Response response = await http.get(Uri.parse(api));
      var data = json.decode(response.body);
      int qid = 1;
      data.forEach((e) {
        String id = e["id"].toString();
        String question = e["question"].toString();
        String answer = e["answer"].toString();
        String option1 = e["option1"].toString();
        String option2 = e["option2"].toString();
        String option3 = e["option3"].toString();
        String option4 = e["option4"].toString();
        String subject = e["subject"].toString();
        int option;
        if (answer == option1) {
          option = 1;
        } else if (answer == option2) {
          option = 2;
        } else if (answer == option3) {
          option = 3;
        } else {
          option = 4;
        }
        var obj = Question(
          qid: qid++,
          id: id,
          question: question,
          answer: answer,
          option1: option1,
          option2: option2,
          option3: option3,
          option4: option4,
          subject: subject,
          option: option,
        );
        questionList.add(obj);
      });
      setState(() {
        isLoading = false;
      });
      // questionList.forEach((element) {
      //   print(element.qid);
      // });
    } catch (e) {
      print(e);
    }
  }

  void getAnswer() {}
  @override
  void initState() {
    fetchData();
    getAnswer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Screen"),
        backgroundColor: Colors.red[200],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: controller,
              itemCount: questionList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Question : ${index + 1} - ${questionList.length}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan[900],
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              questionList[index].question,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            oc1 = Colors.green[200];
                            oc2 = Colors.teal[300];
                            oc3 = Colors.teal[300];
                            oc4 = Colors.teal[300];
                            choosenOption = 1;
                          });
                        },
                        child: Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: oc1,
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              " A.) ${questionList[index].option1}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            oc1 = Colors.teal[300];
                            oc2 = Colors.green[200];
                            oc3 = Colors.teal[300];
                            oc4 = Colors.teal[300];
                            choosenOption = 2;
                          });
                        },
                        child: Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: oc2,
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              " B.) ${questionList[index].option2}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            oc1 = Colors.teal[300];
                            oc2 = Colors.teal[300];
                            oc3 = Colors.green[200];
                            oc4 = Colors.teal[300];
                            choosenOption = 3;
                          });
                        },
                        child: Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: oc3,
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              " C.) ${questionList[index].option3}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            oc1 = Colors.teal[300];
                            oc2 = Colors.teal[300];
                            oc3 = Colors.teal[300];
                            oc4 = Colors.green[200];
                            choosenOption = 4;
                          });
                        },
                        child: Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: oc4,
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              " D.) ${questionList[index].option4}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (index == questionList.length - 2) {
                          setState(() {
                            buttonText = "Finish";
                          });
                        } else {
                          setState(() {
                            buttonText = "Next";
                          });
                        }
                        if (choosenOption == questionList[index].option) {
                          setState(() {
                            correctAnswer += 1;
                          });
                        } else {
                          setState(() {
                            wrongAnswer += 1;
                          });
                        }
                        setState(() {
                          oc1 = Colors.teal[300];
                          oc2 = Colors.teal[300];
                          oc3 = Colors.teal[300];
                          oc4 = Colors.teal[300];
                          choosenOption = 0;
                        });
                        if (index == questionList.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => ResultPage(
                                correctAnswer: correctAnswer,
                                wrongAnswer: wrongAnswer,
                              ),
                            ),
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 5),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                border: Border.all(
                                  width: 3,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    buttonText,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
