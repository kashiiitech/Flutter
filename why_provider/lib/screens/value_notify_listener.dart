import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  // to check password visible and unvisible
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateless Widget"),
      ),
 
      body: Column(
        children: [

          ValueListenableBuilder(
            valueListenable: toggle, 
            builder: (context, builder, child) {
              return TextFormField(
            obscureText: toggle.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffix: InkWell(
                onTap: () {
                  toggle.value = !toggle.value;
                },
                child: Icon( toggle.value ? Icons.visibility_off_outlined : Icons.visibility),
              )
            ),
          );
            }),

          
          Center(
        child: ValueListenableBuilder(
          valueListenable: _counter, 
          builder: (context, value, child) {
            return Text(_counter.value.toString(), style: const TextStyle(fontSize: 35),);
          }),
      ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}