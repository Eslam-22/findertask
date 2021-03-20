import 'package:flutter/material.dart';
import 'package:findertask/constantcolors.dart';

class CustomTextField extends StatelessWidget {

  String enterhint;
  IconData enterIcon;
  TextEditingController controller;


  String errormessage(enterhint) {
    switch (enterhint) {
      case 'Email Adress':
        return 'Adress is Empty';
      case 'Password':
        return 'Password is emtpty';
    }
  }
  String errormessage2(enterhint){
    switch (enterhint){
      case 'Email Adress' :
        return 'Not valide email';
      case 'Password' :
        return 'password  is short';
    }
  }

  String sendemail (enterhint){
    return enterhint;

  }

  CustomTextField(
    @required this.enterhint,
    @required this.enterIcon,
    @required this.controller
  );

  Widget build(BuildContext context) {
    // final String hint;
    return Padding(
      padding: const EdgeInsets.only(left :20,right: 20),
      child: Container(
        height: 40,
        width: 240,
        child: TextFormField(
         controller: controller,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.length<3){
              return errormessage2(enterhint);
            }
            if (value.isEmpty) {
              return errormessage(enterhint);
            }
            },


          obscureText: false,

          style: TextStyle(

            fontSize: 16,
            fontFamily: 'Pacifico',
            color: Colors.grey,
          ),
          textAlign: TextAlign.left,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              enterIcon,
              color: Colors.grey,
            ),
            hintText: enterhint,
            //prefixIcon: Icon(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
