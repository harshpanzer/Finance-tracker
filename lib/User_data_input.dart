import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:money_manager/models/datainvest.dart';
import 'package:money_manager/utils/textformfield.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class UserDataInput extends StatefulWidget {
  const UserDataInput({super.key});

  @override
  State<UserDataInput> createState() => _UserDataInputState();
}

class _UserDataInputState extends State<UserDataInput> {
  TextEditingController amount = TextEditingController();
  double _value = 0;
  late String tax;
  int currentindex = 0;

  static const List<String> list = <String>['Month', 'Year'];
  String dropdownValue = list.first;
  // DateTime _value = DateTime(2002, 01, 01);
  // late String date;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              width: width,
              height: 50,

              //decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Financial Creds',
                      textAlign: TextAlign.center,
                      textStyle: GoogleFonts.getFont(
                        "Ubuntu",
                        fontSize: 30,
                        color: AppColors.skin,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            textformfield(
              amount,
              TextInputType.number,
              'Investment amount',
              (value) {
                if (value == null || value.isEmpty) {
                  return '';
                } else if (value.length != 13) {
                  return '';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Tenure of Investment",
                style: GoogleFonts.getFont(
                  'Ubuntu',
                  fontSize: 20,
                  color: AppColors.skin,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 20),
                    width: width * 0.7,
                    child: Slider(
                      activeColor: AppColors.skin,
                      inactiveColor: AppColors.white,
                      label: _value.round().toString(),
                      value: _value,
                      min: 0,
                      divisions: 12,
                      max: 12,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _value.toInt();
                          print(_value);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    width: width * 0.3,
                    child: DropdownButton<String>(
                      dropdownColor: AppColors.darkpurple,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconDisabledColor: AppColors.white,
                      iconEnabledColor: AppColors.skin,
                      elevation: 15,
                      style: GoogleFonts.getFont(
                        'Ubuntu',
                        fontSize: 20,
                        color: AppColors.skin,
                        fontWeight: FontWeight.w600,
                      ),
                      underline: Container(
                        height: 2,
                        color: AppColors.skin,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Risk Factor",
                style: GoogleFonts.getFont(
                  'Ubuntu',
                  fontSize: 20,
                  color: AppColors.skin,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // set current index!
                          currentindex = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,

                        child: Text("Low",
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontSize: 20,
                              color: AppColors.background,
                              fontWeight: FontWeight.w600,
                            )
                            // TextStyle(
                            //   fontSize: 20,
                            //   fontWeight: FontWeight.w400,
                            // ),
                            ),
                        // padding: EdgeInsets
                        height: height * 0.1,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          color: currentindex == 1
                              ? AppColors.white
                              : AppColors.skin, // Here we checked!
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // set current index!
                          currentindex = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Medium",
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 20,
                            color: AppColors.background,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // padding: EdgeInsets
                        height: height * 0.1,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          color: currentindex == 2
                              ? AppColors.white
                              : AppColors.skin, // Here we checked!
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // set current index!
                          currentindex = 3;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "High",
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 20,
                            color: AppColors.background,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // padding: EdgeInsets
                        height: height * 0.1,
                        width: width * 0.15,
                        decoration: BoxDecoration(
                          color: currentindex == 3
                              ? AppColors.white
                              : AppColors.skin, // Here we checked!
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Submit",
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      fontSize: 20,
                      color: AppColors.background,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // padding: EdgeInsets
                  height: height * 0.07,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.skin,
                    border: Border.all(color: AppColors.lightpurple, width: 5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            )

            // for (int i = 0; i < 5; i++)
            //   InkWell(
            //       onTap: () {
            //         setState(() {
            //           // set current index!
            //           currentindex = i;
            //         });
            //       },
            //       child: Container(
            //           height: height * 0.13,
            //           width: width * 0.2,
            //           decoration: BoxDecoration(
            //               color: currentindex == i
            //                   ? Colors.white
            //                   : Colors.blue, // Here we checked!
            //               border: Border.all(color: Colors.grey),
            //               borderRadius: BorderRadius.all(Radius.circular(15)))))
          ],
        ),
      ),
    );
  }
}
