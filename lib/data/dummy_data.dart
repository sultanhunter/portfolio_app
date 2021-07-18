import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/models/enums/status.dart';
import 'package:portfolio_app/models/project.dart';

final List<Project> projectList = [
  Project(
      title: 'Making History Notes',
      status: Status.inProgress,
      progressHours: 20,
      percentCompleted: 60,
      bgColor: kRedColor),
  Project(
      title: 'Medical App',
      status: Status.inProgress,
      progressHours: 9,
      percentCompleted: 25,
      bgColor: kSecondary),
  Project(
      title: 'Grocery App',
      status: Status.inProgress,
      progressHours: 12,
      percentCompleted: 40,
      bgColor: kPrimary),
  Project(
      title: 'Uber App',
      status: Status.inProgress,
      progressHours: 5,
      percentCompleted: 15,
      bgColor: Colors.blue),
  Project(
      title: 'News App',
      status: Status.done,
      progressHours: 10,
      percentCompleted: 100,
      bgColor: kPrimary)
];
