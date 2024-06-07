import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:inventoryapp/Model/employee_checkIn_class.dart';
import 'package:inventoryapp/Utils/constants.dart';
import 'package:inventoryapp/data/employee_checkIn_data.dart';
import 'package:inventoryapp/data/employee_data.dart';
import '../../ui/admin_view_screens/menu_screens/manage_employee_pages/employee_point_of_sale.dart';
import '../../ui/home_screen.dart';

class AuthScreenWidgets {


  static Widget titleWidget(double height, String imagePath) {
    return Image(
      height: height,
      image: AssetImage(imagePath),
    );
  }

  static Widget emailTextField(TextEditingController emailController) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: "Email...",
        hintStyle: GoogleFonts.aBeeZee(
            color: const Color.fromRGBO(105, 105, 105, 0.4)),
        prefixIcon: const Icon(Icons.email_outlined, color: primaryColor),
      ),
      validator: (value) {
        bool result = EmailValidator.validate(value!);
        return result ? null : "Please enter a valid Email";
      },
    );
  }

  static Widget passwordTextField(TextEditingController passwordController, bool isObscure, VoidCallback toggleObscure) {
    return TextFormField(
      controller: passwordController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: "Password...",
        hintStyle: GoogleFonts.aBeeZee(
            color: const Color.fromRGBO(105, 105, 105, 0.4)),
        prefixIcon: const Icon(Icons.key_outlined, color: primaryColor),
        suffixIcon: GestureDetector(
          onTap: toggleObscure,
          child: Icon(isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
        ),
      ),
      validator: (value) => value!.length > 6 ? null : "Please enter the correct password",
    );
  }

  static Widget authScreenButton(BuildContext context,String _text,TextEditingController email,TextEditingController password) {
    return ElevatedButton(
      onPressed: () {
        if (email.text == "admin123@gmail.com" && password.text == "Admin123") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          bool userFound = false;
          for (int i = 0; i < EmployeeData.employees.length; i++) {
            if (email.text == EmployeeData.employees[i].email && password.text == EmployeeData.employees[i].password) {
              userFound = true;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PointofSalePage(true, eRole: EmployeeData.employees[i].role,)),
              );
              break;
            }
          }
          if (!userFound) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return notSignedInDialog('Email or password is wrong');
              },
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        shape: const RoundedRectangleBorder(),
      ),
      child: Text(
        _text,
        style: GoogleFonts.aBeeZee(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          letterSpacing: 4,
        ),
      ),
    );
  }

  static Widget linkedText(BuildContext context,String text,Widget nextScreen) {
    return GestureDetector(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));},
      child: Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),),
    );
  }

  static Widget notSignedInDialog(String error) {
    return AlertDialog(
      title: Text(error, style: GoogleFonts.playfairDisplay(fontSize: 20)),
      backgroundColor: Colors.white,
      shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
    );
  }
}
