import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              width: width,
              height: 50,

              //decoration: BoxDecoration(color: Colors.amber),
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
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
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
          ],
        ),
      ),
    );
  }
}
