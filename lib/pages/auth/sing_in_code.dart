import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:asadbek_router_lesson/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SingInCodePage extends StatefulWidget {
  const SingInCodePage({
    super.key,
  });

  @override
  State<SingInCodePage> createState() => _SingInCodePageState();
}

class _SingInCodePageState extends State<SingInCodePage> {
  TextEditingController otp = TextEditingController();

  bool isSnackBarShown = false;
  bool isDialogShown = false;

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void showCustomAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  List<String> buttomList = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "<-", "0", "<="];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/images/splesh.svg"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: PinCodeTextField(
                    controller: otp,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    cursorHeight: 90,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      selectedColor: Colors.amber,
                      activeColor: Colors.green,
                      shape: PinCodeFieldShape.box,
                      borderWidth: 0.1,
                      fieldWidth: 60,
                      fieldHeight: 75,
                      activeBorderWidth: 0.1,
                      inactiveColor: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () async {
                    context.go(AppRouterName.main);
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 350,
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 1,
                        childAspectRatio: 1.6,
                      ),
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (buttomList[index] == "<=") {
                                    context.go(AppRouterName.main);
                                  } else {}
                                },
                                splashColor: Colors.grey.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    buttomList[index],
                                    style: const TextStyle(fontSize: 25),
                                  ),
                                ),
                              )),
                        );
                      },
                      itemCount: 12),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
