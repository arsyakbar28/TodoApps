import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/core.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];
  final List<String> text = ["Home", "Profile", "Settings", "Details"];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 90),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColor.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/91388754?v=4",
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Muhammad Arsy Akbar",
            style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
          ),
          Text(
            "FLutter Dev",
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    log('${text[index]} clicked');
                  },
                  child: ListTile(
                    leading: Icon(icons[index], color: Colors.white, size: 30),
                    title: Text(
                      text[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
