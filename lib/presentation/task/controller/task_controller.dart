import 'package:flutter/material.dart';
import 'package:todoapp/core.dart';

class TaskController extends State<TaskView> {
  static late TaskController instance;
  late TaskView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
