import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700,
                ),),
          
                const SizedBox(height: 21,),
          
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Weight (In kgs) '),
                    prefix: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
          
                const SizedBox(height: 11,),
          
          
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height (In Feet)'),
                    prefix: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
          
                const SizedBox(height: 11,),
          
          
                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your Height (In Inches) '),
                    prefix: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
      
                const SizedBox(height: 16,),
      
                ElevatedButton(onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inches = inController.text.toString();
      
                  if(wt != "" && ft != "" && inches !="") {
      
                    // calculate BMI
      
                    // all values from string to int
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inches);
      
                    // changes the units of the values
                    var tInch = (iFt * 12) + iInch;
                    var tCm = tInch*2.54;
                    var tM = tCm / 100;
      
                    var bmi = iWt / (tM * tM);

                    var msg = "";

                    if(bmi > 25) {
                      msg = "You're are OverWeight!!";
                      bgColor = Colors.orange.shade200;

                    }else if(bmi < 18) {
                      msg = "You're are UnderWeight!!";
                      bgColor = Colors.red.shade200;

                    }else {
                      msg = "You're are Healthy!!";
                      bgColor = Colors.green.shade200;

                    }
      
                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(3)}";

                      
                    });
      
                  }
      
                  else {
                    // something is missing
                    setState(() {
                      result = "Please Fill all the required values";
                    });
                  }
                }, child: const Text("Calculate")),
      
      
                const SizedBox(height: 11,),
      
                Text(result, style: const TextStyle(fontSize: 19),),
          
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
