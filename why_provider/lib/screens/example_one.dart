import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget{

  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() {
    return _ExampleOneScreenState();
  }
}

class _ExampleOneScreenState extends State<ExampleOneScreen>{

  double value = 1.0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example one"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
            min: 0,
            max: 1,
            value: value.value, onChanged: (val){
              value.setValue(val);
          });
          }),

          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(value.value),
                  ),
                  child: const Center(child: Text('Container - 1')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(value.value),
                  ),
                  child: const Center(child: Text('Container - 2')),
                ),
              )
            ],
          );
          })


          
          

        ],
      ),
    );
  }

}