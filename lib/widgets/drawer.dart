import 'package:flutter/material.dart';

Widget appDrawer(context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
            accountName: Text("Applore"), accountEmail: Text("accountName")),
        ListTile(
          leading: Icon(Icons.dashboard, color: Colors.blue),
          title: Text("Dashboard"),
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              '/dashboard', (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: Icon(Icons.account_circle_outlined, color: Colors.blue),
          title: Text("Manage Products"),
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              '/manage', (Route<dynamic> route) => false),
        ),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.blue),
          title: Text("Sign Out"),
          onTap: () {},
        )
      ],
    ),
  );
}
