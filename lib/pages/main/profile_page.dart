import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: Center(
          child: Column(
        children: [
          SvgPicture.asset(
            "assets/images/personPNG.svg",
            height: 109,
            width: 109,
            fit: BoxFit.cover,
          ),
          Column(
            children: [Text("data")],
          )
        ],
      )),
    );
  }
}
