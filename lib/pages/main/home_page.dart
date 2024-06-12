import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Map<String, dynamic> maplist = {"Flutter": "assets/images/flutter.svg", "Phyton": "assets/images/phyton.svg"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Hello Asadbek"
          "",
          style: TextStyle(fontWeight: FontWeight.w800),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 6,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // context.go(AppRouterName.homeIchi);
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(height: 20),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(svglist[index].toString()),
                              Text(
                                nameList[index].toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: nameList.length),
      ),
    );
  }
}
