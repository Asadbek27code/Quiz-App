import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:asadbek_router_lesson/data/appColors.dart';
import 'package:asadbek_router_lesson/services/firebase_auth_service.dart';
import 'package:asadbek_router_lesson/services/google_sing_in_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  bool isObscureText = true;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> register() async {
    String email = emailC.text;
    String pass = passwordC.text;
    User? user = await AuthService.loginUser(context, email: email, password: pass);
    if (user != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: DataColor.colorgreen,
          content: const Center(
              child: Text(
            "Successfully login",
            style: TextStyle(color: Colors.white),
          )),
        ));
        context.go(AppRouterName.main);
      }
    } else {
      emailC.clear();
      passwordC.clear();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Center(
            child: Text(
          "login or password error",
          style: TextStyle(color: Colors.white),
        )),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),

          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              "assets/images/splesh.svg",
              width: 200,
            ),
          ),
          const Expanded(
            flex: 2,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 55),
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Your are welcome",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailC,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                        label: const Text(
                          "Email",
                          // style: TextStyle(),
                        ),
                        hintText: "Enter Email",
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
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isObscureText,
                    controller: passwordC,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: DataColor.colorgreen)),
                      label: const Text("Password"),
                      hintStyle: TextStyle(color: DataColor.colorGrey),
                      hintText: "Enter Password",
                      labelStyle: TextStyle(color: DataColor.colorGrey),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          icon: isObscureText
                              ? Icon(
                                  Icons.visibility_off,
                                  color: DataColor.colorGrey,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: DataColor.colorGrey,
                                )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: MaterialButton(
                    height: 60,
                    color: DataColor.colorgreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: double.infinity,
                    onPressed: () async {
                      await register();
                    },
                    child: const Text(
                      "Sing In",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: DataColor.colorGrey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or Sign in With",
                          style: TextStyle(color: DataColor.colorGrey),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: DataColor.colorGrey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ]),
                  child: MaterialButton(
                    onPressed: () async {
                      await AuthGoogle().singInWihtGoogle();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset(
                      "assets/images/google.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            onPressed: () {
              context.go(AppRouterName.singUp);
            },
            child: Row(
              children: [
                const Text(
                  "Don’t have an account? ",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Sign up",
                  style: TextStyle(color: DataColor.colorgreen, fontSize: 11, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08)
          // SizedBox(height: 50),
        ],
      )),
    );
  }
}
