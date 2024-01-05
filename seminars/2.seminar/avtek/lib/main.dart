import 'package:avtek/menu/menu_bar_wrapper.dart';
import 'package:avtek/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avtek',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          const SingleActivator(LogicalKeyboardKey.keyT, control: true):
              VoidCallbackIntent(() {
            debugDumpApp();
          }),
        },
        child: const MenuBarWrapper(
          child: MainPage(),
        ),
      ),
    );
  }
}
