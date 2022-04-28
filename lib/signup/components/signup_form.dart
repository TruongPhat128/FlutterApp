import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/model/user.dart';
import 'package:foodnowapp/model/utilities.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiver/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var email = TextEditingController();
  final password = TextEditingController();
  final conform = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  _savaData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', email.text);
    await prefs.setString('password', password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            emailTextFormField(),
            SizedBox(
              height: 30,
            ),
            passwordTextFormField(),
            SizedBox(
              height: 30,
            ),
            conformTextFormField(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                //thay doi code
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _savaData();
                    //thay doi code
                    Navigator.pop(context,
                        User(username: email.text, password: conform.text));
                    // Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  //thay doi code
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Colors.green,
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
      validator: (value) {
        return Utilities.validateEmail(value!);
      }, //thay doi code
      onSaved: (value) {
        setState(() {
          email.text = value!; //thay doi code
        });
      },
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
        key: _passKey,
        controller: password,
        obscureText: true,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your password",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(Icons.lock_outline)),
        validator: (passwordKey) {
          return Utilities.validatePassword(passwordKey!); //thay doi code
        });
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      controller: conform,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
      validator: (conformPassword) {
        var pass = _passKey.currentState!.value; //thay doi code
        return Utilities.conformPassword(
            conformPassword!, pass); //thay doi code
      },
      onSaved: (value) {
        setState(() {
          conform.text = value!; //thay doi code
        });
      },
    );
  }
} //thay doi code