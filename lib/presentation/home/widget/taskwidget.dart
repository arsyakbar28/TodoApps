// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:todoapp/utils/app_str.dart';
import 'package:todoapp/utils/color_set.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///open task detail
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColor.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColor.primary.withOpacity(0.6),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              ///check uncheck task
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .8),
              ),
              child: Icon(Icons.check, color: AppColor.primary),
            ),
          ),

          //task title
          title: const Padding(
            padding: EdgeInsets.only(top: 3, bottom: 5),
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                // decoration: TextDecoration.lineThrough,
                // decorationColor: Colors.white,
              ),
            ),
          ),

          //task description
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),

              //date of task
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        AppStr.dateString,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        AppStr.timeString,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
