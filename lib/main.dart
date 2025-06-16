import 'package:az_task/az_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
    await ScreenUtil.ensureScreenSize();
  runApp(const AZTask());
}

