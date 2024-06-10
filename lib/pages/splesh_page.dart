import 'dart:async';
import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpleshPage extends StatefulWidget {
  const SpleshPage({super.key});

  @override
  State<SpleshPage> createState() => _SpleshPageState();
}

class _SpleshPageState extends State<SpleshPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      context.go(AppRouterName.singIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/images/splesh.svg').animate().fade(duration: 1800.ms).scaleXY()),
    );
  }
}
