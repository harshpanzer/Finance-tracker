import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:money_manager/features/dataClass.dart';

import '../../stockList.dart';

class DataDisplayScreen extends StatefulWidget {
  const DataDisplayScreen({super.key});

  @override
  State<DataDisplayScreen> createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              color: AppColors.background,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        shadowColor:
                        MaterialStatePropertyAll(AppColors.background),
                        backgroundColor:
                        MaterialStatePropertyAll(AppColors.background)),
                    onPressed: () {},
                    child: Icon(
                      Icons.person_pin_circle_outlined,
                      size: 40,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Best Picks ',
                    style: GoogleFonts.getFont(
                      "Ubuntu",
                      fontSize: 30,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStatePropertyAll(0),
                        shadowColor:
                        MaterialStatePropertyAll(AppColors.background),
                        backgroundColor:
                        MaterialStatePropertyAll(AppColors.background)),
                    onPressed: () {},
                    child: Icon(
                      Icons.power_settings_new_outlined,
                      size: 40,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: width * 0.9,
                height: height * 0.9,
                color: Color.fromARGB(255, 233, 232, 229),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.all(8),

                        color: Colors.white70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          Stock.list[0].replaceAll("\"", ""),
                          style: GoogleFonts.getFont("Ubuntu",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.all(8),

                        color: Colors.white70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),),
                        child: Text(
                          Stock.list[1].replaceAll("\"", ""),
                          style: GoogleFonts.getFont("Ubuntu",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.white70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),),
                        child: Text(
                          Stock.list[2].replaceAll("\"", ""),
                          style: GoogleFonts.getFont("Ubuntu",
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
