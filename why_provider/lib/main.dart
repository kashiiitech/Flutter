import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/provider/count_provider.dart';
import 'package:provider_ex/provider/example_one_provider.dart';
import 'package:provider_ex/provider/favourite_provider.dart';
import 'package:provider_ex/provider/theme_changer_provider.dart';
import 'package:provider_ex/screens/dark_theme.dart';
// import 'package:provider_ex/screens/count_example.dart';
// import 'package:provider_ex/screens/example_one.dart';
import 'package:provider_ex/screens/favourite/favourite_screen.dart';
import 'package:provider_ex/screens/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider(),),
        ChangeNotifierProvider(create: (_) => ThemeChangerProvider(),)
      ],
      // create: (_) => CountProvider(),
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeChanger.themeMode,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: NotifyListenerScreen(),
    );
      })
    );
  }
}