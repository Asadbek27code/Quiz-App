import 'package:asadbek_router_lesson/data/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  List<String> nameList = ["Flutter", "Phyton", "Frontend", "Java", "C++", "C#", "Android", "Apple"];
  List<String> svglist = [
    "assets/images/flutter.svg",
    "assets/images/phyton.svg",
    "assets/images/Frontend.svg",
    "assets/images/Java.svg",
    "assets/images/C++.svg",
    "assets/images/C#.svg",
    "assets/images/android.svg",
    "assets/images/apple.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "My Level"
            "",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 25,
              child: Image.asset(
                "assets/images/image.png",
                width: 46,
                height: 46,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DataColor.colorGrey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        svglist[index],
                        width: 26,
                        height: 26,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        nameList[index],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // trailing: Row(
                  //   children: [
                  //     Text("9/2 "),
                  //     Icon(Icons.arrow_forward_ios),
                  //   ],
                  // ),
                  // leading: Row(
                  //   children: [
                  //     Text("9/2"),
                  //     Icon(Icons.arrow_forward_ios),
                  //   ],
                  // ),
                ),
              ),
            );
          },
          itemCount: nameList.length),
    );
  }
}
