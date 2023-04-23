import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/data.dart';
import '../../dataClass.dart';
import '../../../constants/global_variables.dart';
import '../../../models/user.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/error_handling.dart';
import '../../../utils/show_snackbar.dart';
import '../../stockList.dart';
import '../../userClass.dart';

class StockService {
  getStocks() async {
    try {

      http.Response res = await http.get(
        Uri.parse(mLuri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(res.body);
      var response = res.body.split(",");
      Stock.list[0] = response[0].replaceAll("[", "");
      Stock.list[1] = response[1];
      Stock.list[2] =  response[2].replaceAll("]", "");

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


  void getUserData({
    required BuildContext context,
    required String email,
  }) async {
    try {
      debugPrint("Checkpoint 1");

      var res = await http.post(
        Uri.parse('$uri/user/getDetails'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'email': email,
        },
      );

      var response = jsonDecode(res.body)["details"];
      debugPrint(response);

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
      debugPrint("Checkpoint 3");
    } catch (e) {
      debugPrint("Checkpoint 4");
      debugPrint(e.toString());
      // showSnackBar(context, e.toString());
    }
  }
}
