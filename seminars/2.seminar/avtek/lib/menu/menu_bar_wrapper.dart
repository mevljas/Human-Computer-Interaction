import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:avtek/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuBarWrapper extends StatefulWidget {
  const MenuBarWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<MenuBarWrapper> createState() => _MenuBarWrapperState();
}

class _MenuBarWrapperState extends State<MenuBarWrapper> {
  ShortcutRegistryEntry? _shortcutsEntry;

  static Map<MenuSerializableShortcut, Intent> shortcuts(
      List<dynamic> selections) {
    final Map<MenuSerializableShortcut, Intent> result =
        <MenuSerializableShortcut, Intent>{};
    for (final dynamic selection in selections) {
      if (selection.runtimeType == SubmenuButton &&
          selection.menuChildren != null) {
        result.addAll(shortcuts(selection.menuChildren!));
      } else {
        if (selection.shortcut != null && selection.onPressed != null) {
          result[selection.shortcut!] =
              VoidCallbackIntent(selection.onPressed!);
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      SubmenuButton(
        menuChildren: <Widget>[
          MenuItemButton(
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyA, control: true),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Avtek',
                applicationVersion: '1.0.0',
                children: const <Widget>[
                  Text('Author: Sebastjan Mevlja.'),
                ],
                applicationIcon:
                    Image.asset('assets/car.png', width: 50, height: 50),
              );
            },
            child: const MenuAcceleratorLabel('&About'),
          ),
          MenuItemButton(
            onPressed: () async {
              if (await showOkCancelAlertDialog(
                    context: context,
                    title: 'Confirm',
                    message: 'Would you like to reset the inputs?',
                    okLabel: 'Yes',
                    cancelLabel: 'No',
                  ) ==
                  OkCancelResult.ok) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MenuBarWrapper(
                      child: MainPage(),
                    ),
                  ),
                );
              }
            },
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyR, control: true),
            child: const MenuAcceleratorLabel('&Reset'),
          ),
          MenuItemButton(
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyQ, control: true),
            onPressed: () async {
              if (await showOkCancelAlertDialog(
                    context: context,
                    title: 'Confirm',
                    message: 'Would you like to exit the application?',
                    okLabel: 'Yes',
                    cancelLabel: 'No',
                  ) ==
                  OkCancelResult.ok) {
                exit(0);
              }
            },
            child: const MenuAcceleratorLabel('&Quit'),
          ),
        ],
        child: const MenuAcceleratorLabel('&File'),
      ),
      SubmenuButton(
        menuChildren: <Widget>[
          MenuItemButton(
            shortcut:
                const SingleActivator(LogicalKeyboardKey.keyI, control: true),
            onPressed: () {
              showOkAlertDialog(
                  context: context,
                  title: 'Instructions',
                  message:
                      '1. Fill in the form\n2. Click on the next button\n3. Repeat until you reach the last page\n4. Click on the submit button');
            },
            child: const MenuAcceleratorLabel('&Instructions'),
          ),
        ],
        child: const MenuAcceleratorLabel('&Help'),
      ),
    ];

    _shortcutsEntry?.dispose();
    _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts(children));

    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: children,
              ),
            ),
          ],
        ),
        Expanded(
          child: widget.child,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    super.dispose();
  }
}
