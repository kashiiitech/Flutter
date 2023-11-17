import 'dart:async';
import 'package:flutter/material.dart';


class WhyProviderScreen extends StatefulWidget{
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() {
    return _WhyProviderScreenState();
  }
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {

  int count = 0;

  @override

  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {
        
      });
     });
  }
  Widget build(BuildContext context) {
    // print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString(), style: const TextStyle(fontSize: 50),),
          ),
          Center(
            child: Text(count.toString(), style: const TextStyle(fontSize: 50),),
          )

        ],
      )
    );
  }
}