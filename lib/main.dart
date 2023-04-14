import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'your BMI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome to Healthify Me',
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                color: bgColor,
                child: Center(
                    child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Text(
                        'BMI Calculator',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                      TextField(
                        controller: wtcontroller,
                        decoration: InputDecoration(
                          label: Text("Enter your weight (in Kgs)"),
                          prefixIcon: Icon(Icons.line_weight),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextField(
                        controller: ftcontroller,
                        decoration: InputDecoration(
                          label: Text("Enter your Height (in ft)"),
                          prefixIcon: Icon(Icons.man),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextField(
                        controller: incontroller,
                        decoration: InputDecoration(
                          label: Text("Enter your height (in inches)"),
                          prefixIcon: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var wt = wtcontroller.text.toString();
                          var ft = ftcontroller.text.toString();
                          var inch = incontroller.text.toString();

                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (iFt * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;
                            var bmi = iWt / (tM * tM);
                            var msg = "";
                            if (bmi > 25) {
                              msg = "You are overweight";
                              bgColor = Colors.orange.shade200;
                            } else if (bmi < 18) {
                              msg = "You are underweight";
                              bgColor = Colors.red.shade200;
                            } else {
                              msg = "You are healthy";
                              bgColor = Colors.green.shade200;
                            }
                            setState(() {
                              result =
                                  "$msg \n Your bmi is : ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill all the required blanks";
                            });
                          }
                        },
                        child: Text("Calculate"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        result,
                        style: TextStyle(fontSize: 16),
                      ),
                      Image.asset('assets/fitness.png'),
                    ],
                  ),
                )))));
  }
}
