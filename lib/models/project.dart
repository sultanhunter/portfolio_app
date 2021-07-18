import 'package:flutter/material.dart';
import 'package:portfolio_app/models/enums/status.dart';

class Project {
  final String title;
  final Status status;
  final int progressHours;
  final int percentCompleted;
  final Color bgColor;

  Project(
      {required this.title,
      required this.status,
      required this.progressHours,
      required this.percentCompleted,
      required this.bgColor});
}
