import 'dart:io';

import 'package:avtek/menu/menu_bar_wrapper.dart';
import 'package:avtek/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(1200, 600));
    // WindowManager.instance.setMaximumSize(const Size(1200, 600));
  }
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
