import 'package:flutter/material.dart';
import 'package:money_manager/FadeAnimation.dart';
import 'package:money_manager/features/auth/screens/sign_in.dart';
import 'package:money_manager/features/userClass.dart';

import '../../../constants/app_color.dart';
import '../services/auth_services.dart';

class UserSignIn extends StatefulWidget {
  UserSignIn({super.key});

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final signUpKey = GlobalKey<FormState>();

  @override
  final email = TextEditingController();
  final pass = TextEditingController();
  final usernametextconroller = TextEditingController();
  final budget = TextEditingController();
  final otp = TextEditingController();
  final AuthService authService = AuthService();


  // void signUpUser() async {
  //   debugPrint("checkpoint  7 0");
  //   await authService.signUpUser(email: email.text, password: pass.text, name: usernametextconroller.text,);
  //   debugPrint("okay");
  // }

  getOtp() async {
    await authService.verifyEmail(
      context: context,
      email: email.text,
    );
  }

  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/images/bg1.jpeg"),
                //         fit: BoxFit.cover)),
                child: Column(children: <Widget>[
          Container(
            height: 350,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 150,
                  child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/light-1.png"))),
                      )),
                ),
                Positioned(
                  left: 140,
                  width: 80,
                  height: 100,
                  child: FadeAnimation(
                      1.3,
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/light-2.png"))),
                      )),
                ),
                Positioned(
                  right: 40,
                  top: 40,
                  width: 80,
                  height: 100,
                  child: FadeAnimation(
                      1.5,
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/clock.png"))),
                      )),
                ),
                Positioned(
                  child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: signUpKey,
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1.8,
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Name';
                                } else if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return 'Enter Valid Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(158, 158, 158, 1)))),
                            child: TextFormField(
                              controller: pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter a Password';
                                  // } else if (!RegExp(
                                  //         r'^(?=(.*[a-z]){3,})(?=(.*[A-Z]){2,})(?=(.*[0-9]){2,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$')
                                  //     .hasMatch(value)) {
                                  //   return 'Enter Valid Password';
                                } else if (value.length < 8) {
                                  return 'Enter a Password containing more than 8 characters';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(158, 158, 158, 1)))),
                            child: TextFormField(
                              controller: usernametextconroller,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(8.0),
                          //   decoration: BoxDecoration(
                          //       border: Border(
                          //           bottom: BorderSide(
                          //               color: Colors.grey))),
                          //   child: TextFormField(
                          //     controller: budget,
                          //     keyboardType: TextInputType.number,
                          //     decoration: InputDecoration(
                          //         border: InputBorder.none,
                          //         hintText: "Budget",
                          //         hintStyle: TextStyle(
                          //             color: Colors.grey[400])),
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'Enter Your Budget';
                          //       } else if (!RegExp(r'^[0-9]+$')
                          //           .hasMatch(value)) {
                          //         return 'Enter A Valid Amount';
                          //       }
                          //       return null;
                          //     },
                          //   ),
                          // ),
                          //       Container(
                          //         padding: EdgeInsets.all(8.0),
                          //         child: TextFormField(
                          //           controller: age,
                          //           keyboardType: TextInputType.number,
                          //           decoration: InputDecoration(
                          //               border: InputBorder.none,
                          //               hintText: "Age",
                          //               hintStyle: TextStyle(
                          //                   color: Colors.grey[400])),
                          //           validator: (value) {
                          //             if (value == null || value.isEmpty) {
                          //               return 'Enter Your Age';
                          //             } else if (!RegExp(r'^[0-9]+$')
                          //                 .hasMatch(value)) {
                          //               return 'Enter A Valid Age';
                          //             }
                          //             return null;
                          //           },
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // )),
                          SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                              2,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ])),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      debugPrint("sdfghjkl");
                                      await getOtp();
                                      _displayTextInputDialog(context);
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Row(children: <Widget>[
                            // FadeAnimation(
                            //     1.5,
                            //     Text(
                            //       "Forgot Password?",
                            //       style: TextStyle(
                            //           color: Color.fromRGBO(143, 148, 251, 1)),
                            //     )),
                            SizedBox(
                              width: scwidth * 0.3,
                            ),
                            FadeAnimation(
                                1.5,
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => SignInScreen()));
                                  },
                                  child: Text(
                                    "Existing User?",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                )),
                          ])
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]))));
  }
  Future<void> _displayTextInputDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Verify your E-mail'),
            content: TextField(
              controller: otp,
              decoration: InputDecoration(hintText: "OTP"),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.background)),
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.background)),
                child: Text('OK'),
                onPressed: () {
                  print(otp.text);

                  debugPrint(UserClass.otp);
                  debugPrint(otp.text);
                  debugPrint("1234567");
                  if (UserClass.otp == otp.text) {
                    Navigator.pop(context);
                    authService.signUpUser(email: email.text, password: pass.text, name: usernametextconroller.text,);
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
                    debugPrint("dgdg");
                  }
                  else{
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          );
          },
        );
    }
}
