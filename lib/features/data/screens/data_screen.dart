import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants/app_color.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:money_manager/features/dataClass.dart';
import 'package:money_manager/features/home/screens/home_screen.dart';
import 'package:money_manager/features/home/services/home_services.dart';
import 'package:money_manager/models/data.dart';
import 'package:money_manager/utils/textformfield.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

import '../services/data_services.dart';

class UserDataInput extends StatefulWidget {
  const UserDataInput({super.key});

  @override
  State<UserDataInput> createState() => _UserDataInputState();
}

class _UserDataInputState extends State<UserDataInput> {
  TextEditingController incomeController = TextEditingController();
  TextEditingController expenditureController = TextEditingController();

  double _value = 0;
  late String tax;
  int currentIndex = 0;

  static const List<String> list = <String>['Month', 'Year'];
  String dropdownValue = list.first;

  static const List<String> regime = <String>['New Tax Regime', 'Old Tax Regime'];
  String regimeValue = regime.first;

  DataService dataService = DataService();
  StockService stockService = StockService();

  postData() async {
    debugPrint("E");
    Data data = Data(
      email: DataClass.email,
      income: DataClass.income,
      expenditure: DataClass.expenditure,
      time: DataClass.time,
      risk: DataClass.risk,
      regime: DataClass.regime,
      bills: DataClass.bills,
      recharges: DataClass.recharges,
    );
    await dataService.postData(data: data);
    debugPrint("wegwr");
  }

  getStocks()async{
   await  stockService.getStocks();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        color: AppColors.background,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
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
              const SizedBox(
                height: 20,
              ),
              textformfield(
                incomeController,
                TextInputType.number,
                'Income',
                (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  } else if (value.length != 13) {
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              textformfield(
                expenditureController,
                TextInputType.number,
                'Expenditure',
                    (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  } else if (value.length != 13) {
                    return '';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: width,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(right: 20),
                      width: width * 0.7,
                      child: Slider(
                        activeColor: AppColors.skin,
                        inactiveColor: AppColors.white,
                        label: _value.round().toString(),
                        value: _value,
                        min: 0.0,
                        divisions: 12,
                        max: 12.0,
                        onChanged: (value) {
                          setState(() {
                            _value = value;

                            _value.toInt();
                            debugPrint(_value.toString());
                            DataClass.time = _value as String;
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      width: width * 0.3,
                      child: DropdownButton<String>(
                        dropdownColor: Colors.purple,
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
                            DataClass.typeTime = value;
                          });
                        },

                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Tax Regime",
                  style: GoogleFonts.getFont(
                    'Ubuntu',
                    fontSize: 20,
                    color: AppColors.skin,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(right: 20),
                width: width * 0.6,
                child: DropdownButton<String>(
                  dropdownColor: Colors.purple,
                  value: regimeValue,
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
                      regimeValue = value!;
                      DataClass.regime = value;
                    });
                  },
                  items: regime.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
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
              const SizedBox(
                height: 20,
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
                            currentIndex = 1;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // padding: EdgeInsets
                          height: height * 0.1,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            color: currentIndex == 1
                                ? AppColors.white
                                : AppColors.skin, // Here we checked!
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),

                          child: Text("Low",
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontSize: 20,
                                color: AppColors.background,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // set current index!
                            currentIndex = 2;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // padding: EdgeInsets
                          height: height * 0.1,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            color: currentIndex == 2
                                ? AppColors.white
                                : AppColors.skin, // Here we checked!
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Text(
                            "Medium",
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontSize: 20,
                              color: AppColors.background,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // set current index!
                            currentIndex = 3;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // padding: EdgeInsets
                          height: height * 0.1,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                            color: currentIndex == 3
                                ? AppColors.white
                                : AppColors.skin, // Here we checked!
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "High",
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontSize: 20,
                              color: AppColors.background,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  DataClass.income = incomeController.text;
                  DataClass.expenditure = expenditureController.text;
                  DataClass.time = (DataClass.typeTime == "Year")? _value.toString(): (_value * 12).toString();
                  if (currentIndex == 1) {
                    DataClass.risk = "Low";
                  } else if (currentIndex == 2) {
                    DataClass.risk = "Medium";
                  } else {
                    DataClass.risk = "High";
                  }
                  debugPrint("rdsg");
                  await postData();
                  await getStocks();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> DataDisplayScreen()), (route) => false);
                },
                child: Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets
                  height: height * 0.07,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.skin,
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.getFont(
                      'Ubuntu',
                      fontSize: 20,
                      color: AppColors.background,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
