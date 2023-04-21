import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/constants/app_color.dart';

textformfield(
  TextEditingController controller,
  TextInputType keyboardtype,
  String labelText,
  String? Function(String?)? validator,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 10, 60, 0),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardtype,

      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.currency_rupee_sharp,
        ),
        prefixIconColor: AppColors.white,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColors.white, width: 4),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 4,
            color: AppColors.skin,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: Colors.red, width: 4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColors.skin, width: 4),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(color: AppColors.white, width: 4),
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: 20,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        hintText: 'Enter $labelText',
        hintStyle: GoogleFonts.getFont(
          'Ubuntu',
          fontSize: 20,
          color: AppColors.skin,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(height: 0),
      ),
      style: GoogleFonts.getFont(
        'Ubuntu',
        fontSize: 20,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      //cursorColor: (width > 710) ? AppColors.backColor : AppColors.whiteColor,
      inputFormatters: [
        FilteringTextInputFormatter.singleLineFormatter,
      ],
      validator: validator,
    ),
    //       labelText: "Investment amount",
    //       icon: Icon(Icons.currency_rupee),
    //       labelStyle: TextStyle(decorationColor: Colors.white)),
  );
}
