import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:money_manager/models/data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/screens/data_screen.dart';
import '../../dataClass.dart';
import '../../../constants/global_variables.dart';
import '../../../models/user.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/error_handling.dart';
import '../../../utils/show_snackbar.dart';
import '../../userClass.dart';

class AuthService {
  signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {

      debugPrint(email);
      debugPrint(name);
      debugPrint(password);


      http.Response res = await http.post(
        Uri.parse('$uri/register'),
        body: jsonEncode({
          "name":name,
          "email":email,
          "password":password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(jsonDecode(res.body)['token']);

      UserClass.token = jsonDecode(res.body)['token'];
      UserClass.name = name;
      UserClass.email = email;
      // debugPrint("Checkpoint 2");



      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () {
      //       showSnackBar(
      //         context,
      //         'Account created! Login with the same credentials',
      //       );
      //     });

      debugPrint("Checkpoint 3");
    } catch (e) {
      debugPrint("Checkpoint 4");
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }

  verifyEmail({
    required BuildContext context,
    required String email,
  }) async {
    try {

      // debugPrint("Checkpoint 1");

      http.Response res = await http.post(
        Uri.parse('$uri/user/verifyemail'),
        body: jsonEncode({
          "email":email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // debugPrint("Checkpoint 2");

      debugPrint(res.body);
      UserClass.otp = jsonDecode(res.body)['otp'];
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () {
      //       showSnackBar(
      //         context,
      //         'Account created! Login with the same credentials',
      //       );
      //     });

      debugPrint("Checkpoint 3");
    } catch (e) {
      debugPrint("Checkpoint 4");
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      //debugPrint("Checkpoint 1");
      http.Response res = await http.post(
        Uri.parse('$uri/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      //debugPrint("Checkpoint 2");

      debugPrint(res.body);
      if(jsonDecode(res.body)['success']==true){
        DataClass.email = UserClass.email;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> UserDataInput()), (route) => false);
        // User user = jsonDecode(res.body)['user'];
        // UserClass.name = user.name;
        // UserClass.email = user.email;
        // UserClass.token = user.token;
      }


      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () async {
      //     if (keepSignedIn) {
      //       final prefs = await SharedPreferences.getInstance();
      //       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //       await prefs.setString(
      //           'x-auth-token', jsonDecode(res.body)['token']);
      //       Navigator.pushNamedAndRemoveUntil(
      //         context,
      //         HomeScreen.routeName,
      //             (route) => false,
      //       );
      //     }
      //   },
      // );
      debugPrint("Checkpoint 3");
    } catch (e) {
      debugPrint("Checkpoint 4");
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({
    required BuildContext context,
    required String email,
  }) async {
    try {
      debugPrint("Checkpoint 1");
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? token = prefs.getString('x-auth-token');
      // if (token == null) {
      //   prefs.setString('x-auth-token', '');
      // }

      var tokenRes = await http.post(
        Uri.parse('$uri/api/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'email': email,
        },
      );

      var response = jsonDecode(tokenRes.body);

      // if (response == true) {
      //   http.Response userRes = await http.get(
      //     Uri.parse('$uri/'),
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'x-auth-token': token,
      //     },
      //   );
      //
      //   var userProvider = Provider.of<UserProvider>(context, listen: false);
      //   userProvider.setUser(userRes.body);
      // }

      // debugPrint(res.body);
      //
      // httpErrorHandle(
      //   response: res,
      //   context: context,
      //   onSuccess: () async {
      //     if (keepSignedIn) {
      //       final prefs = await SharedPreferences.getInstance();
      //       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //       await prefs.setString(
      //           'x-auth-token', jsonDecode(res.body)['token']);
      //       Navigator.pushNamedAndRemoveUntil(
      //         context,
      //         HomeScreen.routeName,
      //             (route) => false,
      //       );
      //     }
      //   },
      // );
      // debugPrint("Checkpoint 3");
    } catch (e) {
      debugPrint("Checkpoint 4");
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }
}
