import 'package:asadbek_router_lesson/app.dart';
import 'package:asadbek_router_lesson/pages/setup.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  await setup();
  runApp(const App());
}
