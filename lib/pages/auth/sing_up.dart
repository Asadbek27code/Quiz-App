import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:asadbek_router_lesson/data/appColors.dart';
import 'package:asadbek_router_lesson/services/firebase_auth_service.dart';
import 'package:asadbek_router_lesson/services/google_sing_in_firebase.dart';
import 'package:asadbek_router_lesson/services/util_service.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  Future<void> register() async {
    String name = nameC.text;
    String email = emailC.text;
    String pass = passwordC.text;
    if (name.isEmpty || name.length < 2) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Bo'sh joylar bulmasligi kerak"),
      ));
    } else if (email.isEmpty || email.length < 2 || !email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Center(
            child: Text(
          "Email is badly formatted",
          style: TextStyle(color: Colors.white),
        )),
      ));
    } else if (pass.isEmpty || pass.length < 5) {
      Utils.fireSnackBar("Password should be more than 6 char", context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Center(
            child: Text(
          "Password should be more than 6 char",
          style: TextStyle(color: Colors.white),
        )),
      ));
    } else {
      // myAuth.setConfig(appEmail: "me@rohitchouhan.com", appName: "Email OTP", userEmail: email, otpLength: 4, otpType: OTPType.digitsOnly);
      User? user = await AuthService.registerUser(context, name: name, email: email, password: pass);
      if (user != null) {
        if (mounted) {
          Utils.fireSnackBar("Successfully registered", context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Center(
                child: Text(
              "Successfully registered",
              style: TextStyle(color: Colors.white),
            )),
          ));
          context.go(AppRouterName.singIn);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),

          const Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 130),
                child: Column(
                  children: [
                    Text(
                      "  Create an account",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                    Text("Let’s help you set up your account, \nit won’t take long.")
                  ],
                ),
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    controller: nameC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        label: const Text("full name"),
                        labelStyle: TextStyle(
                          color: DataColor.colorGrey,
                        ),
                        suffixIcon: Icon(
                          Icons.person,
                          color: DataColor.colorGrey,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    controller: emailC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        label: const Text("email"),
                        labelStyle: TextStyle(
                          color: DataColor.colorGrey,
                        ),
                        suffixIcon: Icon(
                          Icons.email,
                          color: DataColor.colorGrey,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: TextField(
                    controller: passwordC,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: DataColor.colorGrey,
                            )),
                        label: const Text("password"),
                        labelStyle: TextStyle(
                          color: DataColor.colorGrey,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: DataColor.colorGrey,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                      "Sing Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
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
                          "Or Sign up With",
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
            padding: const EdgeInsets.symmetric(horizontal: 100),
            onPressed: () {
              context.go(AppRouterName.singIn);
            },
            child: Row(
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(fontSize: 11, color: DataColor.colorBlack),
                ),
                const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.green),
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
