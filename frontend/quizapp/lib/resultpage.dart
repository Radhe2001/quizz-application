import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'homepage.dart';

class ResultPage extends StatefulWidget {
  final int correctAnswer;
  final int wrongAnswer;

  const ResultPage({
    super.key,
    required this.correctAnswer,
    required this.wrongAnswer,
  });
  @override
  _ResultPageState createState() =>
      _ResultPageState(correctAnswer: correctAnswer, wrongAnswer: wrongAnswer);
}

class _ResultPageState extends State<ResultPage> {
  final int correctAnswer;
  final int wrongAnswer;
  double marks = 0.0;
  _ResultPageState({
    required this.correctAnswer,
    required this.wrongAnswer,
  });

  @override
  void initState() {
    super.initState();
    marks += (correctAnswer * 1) - (wrongAnswer * 0.25);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.red[200],
      ),
      body: Container(
        color: Colors.lime[200],
        child: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.teal[300],
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PieChart(
                      dataMap: <String, double>{
                        "correct": correctAnswer.toDouble(),
                        "incorrect": wrongAnswer.toDouble(),
                      },
                      chartType: ChartType.ring,
                      baseChartColor: Colors.red!,
                      colorList: const <Color>[Colors.blue, Colors.red],
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Total correct answers : ${correctAnswer}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total incorrect answers : ${wrongAnswer}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Total marks obtained answers : ${marks}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Go to home page",
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
            ],
          ),
        ),
      ),
    );
  }
}
