import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todoapp/core.dart';
import 'package:todoapp/presentation/task/widget/date_time_selection.dart';
import 'package:todoapp/presentation/task/widget/rep_text_field.dart';
import 'package:todoapp/presentation/task/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  Widget build(context, TaskController controller) {
    controller.view = this;

    final TextEditingController titleTaskController = TextEditingController();
    // ignore: unused_local_variable
    final TextEditingController descriptionTaskController =
        TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const TaskViewAppBar(),

        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTopSideText(Theme.of(context).textTheme),

                _buildMainTaskViewActivity(
                  context,
                  titleTaskController,
                  descriptionTaskController,
                ),

                //bottom button
                _buildBottomSideButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<TaskView> createState() => TaskController();
}

Padding _buildBottomSideButton() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //delete task button
        MaterialButton(
          onPressed: () {
            log('Delete Task Button Pressed');
          },
          minWidth: 150,
          height: 50,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(Icons.delete, color: AppColor.primary),
              const SizedBox(width: 8),
              Text(
                AppStr.deleteTask,
                style: const TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        //add update task button
        MaterialButton(
          onPressed: () {
            log('Add Task Button Pressed');
          },
          minWidth: 150,
          height: 50,
          color: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                AppStr.addTaskString,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildTopSideText(TextTheme textTheme) {
  return SizedBox(
    width: double.infinity,
    height: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Tambahkan jarak dari atas
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Divider(thickness: 2)),
            const SizedBox(width: 10),
            // RichText is not const because it depends on context
            RichText(
              text: TextSpan(
                text: AppStr.addNewTask,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(child: Divider(thickness: 2)),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMainTaskViewActivity(
  BuildContext context,
  TextEditingController titleTaskController,
  TextEditingController descriptionTaskController,
) {
  return SizedBox(
    width: double.infinity,
    height: 530,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            AppStr.titleOfTitleTextField,
            style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ),

        // Task title text field
        RepTextField(controller: titleTaskController),

        RepTextField(
          controller: descriptionTaskController,
          isForDescription: true,
        ),

        DateTimeSelectionWidget(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder:
                  (_) => SizedBox(
                    height: 300,
                    child: TimePickerWidget(
                      //initdateTime:
                      onChange: (_, __) {},
                      dateFormat: 'HH:mm',
                      onConfirm: (dateTime, _) {},
                    ),
                  ),
            );
          },
          title: AppStr.timeString,
        ),
        DateTimeSelectionWidget(
          onTap: () {
            DatePicker.showDatePicker(
              context,
              pickerTheme: DateTimePickerTheme(
                showTitle: true,
                itemTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              initialDateTime: DateTime.now(),
              dateFormat: 'dd-MMMM-yyyy',
              locale: DateTimePickerLocale.en_us,
              onConfirm: (dateTime, _) {},
            );
          },
          title: AppStr.dateString,
        ),
      ],
    ),
  );
}
