import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:asadbek_router_lesson/data/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: ListView(
        children: [
          Center(
              child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/personPNG.svg",
                height: 109,
                width: 109,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("User Name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                      Text("Asadbek Ibragimov", style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Text("Phone Number", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                      Text(
                        "+998906709767",
                        style: TextStyle(fontSize: 27, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Divider(
                      color: DataColor.colorGrey,
                      indent: 1,
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 220),
                      child: Text(
                        "Enter your information \nto make changes",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // controller: emailC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                      label: const Text(
                        "First Name",
                        // style: TextStyle(),
                      ),
                      hintText: "Enter First Name",
                      hintStyle: TextStyle(
                        color: DataColor.colorGrey,
                      ),
                      labelStyle: TextStyle(color: DataColor.colorGrey),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // controller: emailC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                      label: const Text(
                        "Last Name",
                        // style: TextStyle(),
                      ),
                      hintText: "Enter Last Name",
                      hintStyle: TextStyle(
                        color: DataColor.colorGrey,
                      ),
                      labelStyle: TextStyle(color: DataColor.colorGrey),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // controller: emailC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                      label: const Text(
                        "Password",
                        // style: TextStyle(),
                      ),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        color: DataColor.colorGrey,
                      ),
                      labelStyle: TextStyle(color: DataColor.colorGrey),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // controller: emailC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                      label: const Text(
                        "Confirm Password",
                        // style: TextStyle(),
                      ),
                      // labelText: "Confirm Password",
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        color: DataColor.colorGrey,
                      ),
                      labelStyle: TextStyle(color: DataColor.colorGrey),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: MaterialButton(
                  height: 60,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: double.infinity,
                  onPressed: () {
                    context.go(AppRouterName.singIn);
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
