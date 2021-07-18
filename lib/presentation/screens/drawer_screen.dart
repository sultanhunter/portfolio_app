import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/constants.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: kSecondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/profile.png'),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    'Sultan Ibne Usman',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuItems(
                    icon: Icons.payment,
                    title: 'Payments',
                    onTap: () {},
                  ),
                  MenuItems(
                    icon: Icons.favorite,
                    title: 'Discounts',
                    onTap: () {},
                  ),
                  MenuItems(
                    icon: Icons.notifications,
                    title: 'Notification',
                    onTap: () {},
                  ),
                  MenuItems(
                    icon: Icons.list,
                    title: 'Orders',
                    onTap: () {},
                  ),
                  MenuItems(
                    icon: Icons.help,
                    title: 'Help',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  MenuItems(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  MenuItems(
                    icon: Icons.support,
                    title: 'Support',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItems(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.white.withOpacity(0.2),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
