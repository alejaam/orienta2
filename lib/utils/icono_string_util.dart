import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert"     : Icons.add_alert,
  "accessibility" : Icons.accessibility,
  "folder_open"   : Icons.folder_open,
  "school"        : Icons.school,
  "donut_large"   : Icons.donut_large,
  "input"         : Icons.input,
  "slider"        : Icons.tune,
  "list"          : Icons.list,
  "assignment"    : Icons.assignment,
  "description"   : Icons.description,
  "calendar_today": Icons.calendar_today,
  "assessment"    : Icons.assessment
};

Icon getIcon(String nombreIcono){
  return Icon(
    _icons[nombreIcono],
    size: 40.0,
    color: Colors.white,);
}