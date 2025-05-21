// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/core.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  final GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  static List<int> testing = [1];

  Widget build(context, HomeController controller) {
    controller.view = this;

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //FloatingActionButton
      floatingActionButton: floatingActionButton(),

      //ProggressIndicator
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,
        slider: CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0), // geser ke bawah 16px
            child: HomeAppBar(drawerKey: drawerKey),
          ),
        ),
        child: _homeBody(textTheme, controller),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}

Widget _homeBody(TextTheme textTheme, State controller) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
