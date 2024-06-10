import 'package:asadbek_router_lesson/pages/main/home_page.dart';
import 'package:asadbek_router_lesson/pages/main/level_page.dart';
import 'package:asadbek_router_lesson/pages/main/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

// List<Widget> pagesList = const [
//   HomePage(),
//   LevelPage(),
//   ProfilePage(),
// ];

int tanlov = 0;

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.child,
        bottomNavigationBar: Container(
          height: 80,
          width: double.infinity,
          color: Colors.transparent,
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/buttonnaviagatorbar.svg",
                fit: BoxFit.fill,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.1),
                // color: Colors.black,
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            tanlov = 0;
                            setState(() {});
                          },
                          // ignore: deprecated_member_use
                          icon: SvgPicture.asset(
                            "assets/images/home.svg",
                            color: tanlov == 0 ? Colors.green : null,
                          )),
                      IconButton(
                          onPressed: () {
                            tanlov = 1;
                            setState(() {});
                          },
                          icon: SvgPicture.asset(
                            "assets/images/level.svg",
                            color: tanlov == 1 ? Colors.green : null,
                          )),
                      IconButton(
                        onPressed: () {
                          tanlov = 2;
                          setState(() {});
                        },
                        icon: SvgPicture.asset(
                          "assets/images/profile.svg",
                          color: tanlov == 2 ? Colors.green : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
