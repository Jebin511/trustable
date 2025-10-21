import 'package:flutter/material.dart';
import 'package:trustable/Otp.dart';
import 'package:trustable/bottomnav.dart';
import 'package:trustable/call.dart';
import 'package:trustable/chitmember.dart';
import 'package:trustable/documents.dart';
import 'package:trustable/personalprof.dart';
import 'package:trustable/plan.dart';
import 'package:trustable/regcheck.dart';
import 'package:trustable/transaction_screen.dart';
import 'package:trustable/welcome.dart';
import 'package:trustable/choose.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/choose',
    routes: {
      '/choose': (context) => ChoosePage(),
      '/welcome': (context) => WelcomePage(),
      '/home': (context) => BottomNavExample(),
    },
  ));
}