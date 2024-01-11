import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:avtek/pages/main_page.dart';
import 'package:flutter/material.dart';

class MenuBarWrapper extends StatelessWidget {
  const MenuBarWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'Avtek',
                            applicationVersion: '1.0.0',
                            children: const <Widget>[
                              Text('Author: Sebastjan Mevlja.'),
                            ],
                            applicationIcon: Image.asset('assets/car.png',
                                width: 50, height: 50),
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
                        child: const MenuAcceleratorLabel('&Reset'),
                      ),
                      MenuItemButton(
                        onPressed: () async {
                          if (await showOkCancelAlertDialog(
                                context: context,
                                title: 'Confirm',
                                message:
                                    'Would you like to exit the application?',
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
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
