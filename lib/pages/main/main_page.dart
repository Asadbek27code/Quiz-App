import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        context.go(AppRouterName.home);
        break;
      case 1:
        context.go(AppRouterName.level);
        break;
      case 2:
        context.go(AppRouterName.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(selectedIndex == 0 ? "assets/images/home2.svg" : "assets/images/home.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(selectedIndex == 1 ? "assets/images/level2.svg" : "assets/images/level.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(selectedIndex == 2 ? "assets/images/profile2.svg" : "assets/images/profile.svg"),
            label: "",
          ),
        ],
      ),
    );
  }
}
