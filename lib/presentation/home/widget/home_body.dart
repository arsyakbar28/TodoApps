
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/assets/lootie_asset.dart';
import 'package:todoapp/presentation/home/view/home_view.dart';
import 'package:todoapp/presentation/home/widget/taskwidget.dart';
import 'package:todoapp/utils/app_str.dart';
import 'package:todoapp/utils/color_set.dart';

// ignore: unused_element
Widget _homeBody(TextTheme textTheme, State controller) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(AppColor.primary),
                    ),
                  ),
                  SizedBox(width: 20),
    
                  //Top Level Task Info
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStr.mainTitle,
                        style: textTheme.displayLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "1 of 3 Task",
                        style: textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    
            //divider
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(thickness: 2, indent: 90),
            ),
    
            //task list
            Expanded(
              child:
                  HomeView.testing.isNotEmpty
                      ? ListView.builder(
                        itemCount: HomeView.testing.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.horizontal,
                            onDismissed: (_) {
                              // Remove the item from the list and rebuild
                              // ignore: invalid_use_of_protected_member
                              controller.setState(() {
                                HomeView.testing.removeAt(index);
                              });
    
                              // Optionally: remove from db here
                            },
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  AppStr.deleteTask,
                                  style: TextStyle(
                                    // ignore: deprecated_member_use
                                    color: Colors.red.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            key: Key(HomeView.testing[index].toString()),
                            child: const TaskWidget(),
                          );
                        },
                      )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FadeInUp(
                            child: SizedBox(
                              child: Lottie.asset(
                                lottieURL,
    
                                animate: HomeView.testing.isNotEmpty ? false : true,
                              ),
                            ),
                          ),
                          FadeInUp(
                            from: 30,
                            child: Text(
                              AppStr.doneAllTask,
                              style: textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        ),
      );
  }

