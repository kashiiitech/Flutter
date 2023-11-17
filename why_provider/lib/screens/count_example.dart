import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() {
    return _CountExampleState();
  }
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter Example"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print('Only this widget builds');
          return Text(countProvider.count.toString(), style: const TextStyle(fontSize: 50),);
        },),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add), 
        ),    
    );
  }
}