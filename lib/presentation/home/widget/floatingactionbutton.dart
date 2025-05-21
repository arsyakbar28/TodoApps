import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/presentation/task/view/task_view.dart';
import 'package:todoapp/utils/color_set.dart';

// ignore: camel_case_types
class floatingActionButton extends StatelessWidget {
  const floatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const TaskView()),
        );
        // Add your onTap code here
      },
      child: Material(
        borderRadius: BorderRadius.circular(35),
        elevation: 10,
        child: Container(
          width: 70,
          height: 70,

          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(35),
          ),
          child: const Center(
            child: Icon(Icons.add, color: Colors.white, size: 35),
          ),
        ),
      ),
    );
  }
}
