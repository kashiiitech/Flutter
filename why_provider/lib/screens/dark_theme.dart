import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('light Mode'),
            value: ThemeMode.light, 
            groupValue: themeChanger.themeMode, 
            onChanged: themeChanger.setTheme),
            RadioListTile<ThemeMode>(
            title: Text('dark Mode'),
            value: ThemeMode.dark, 
            groupValue: themeChanger.themeMode, 
            onChanged: themeChanger.setTheme),
            RadioListTile<ThemeMode>(
            title: Text('system Mode'),
            value: ThemeMode.system, 
            groupValue: themeChanger.themeMode, 
            onChanged: themeChanger.setTheme)
        ],
      ),
    );
  }
}