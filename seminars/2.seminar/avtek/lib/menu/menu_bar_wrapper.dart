import 'dart:io';

import 'package:avtek/pages/main_page.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
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
                            applicationIcon: Image.asset('assets/car.png',
                                width: 50, height: 50),
                          );
                        },
                        child: const MenuAcceleratorLabel('&About'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MenuBarWrapper(
                                child: MainPage(),
                              ),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Reset'),
                      ),
                      MenuItemButton(
                        onPressed: () async {
                          if (await confirm(
                            context,
                            title: const Text('Confirm'),
                            content: const Text(
                                'Would you like to exit the application?'),
                            textOK: const Text('Yes'),
                            textCancel: const Text('No'),
                          )) {
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Magnify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Minify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Mi&nify'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Edit'),
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
