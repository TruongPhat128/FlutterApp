import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodnowapp/homepage/components/fragment/home_fragment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/user.dart';
import '../../homepage.dart';
import '../menuheader.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  var prefs;
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();
  _getData() async {
    prefs = await SharedPreferences.getInstance();
    fullname.text = prefs.getString('fullname');
    email.text = prefs.getString('username');
    address.text = prefs.getString('address');
    phone.text = prefs.getString('phone');
    password.text = prefs.getString('password');
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Column(
      children: [
        MenuHeader(),
        Form(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                fullnameTextFormField(),
                SizedBox(
                  height: 10,
                ),
                emailTextFormField(),
                SizedBox(
                  height: 10,
                ),
                passwordTextFormField(),
                SizedBox(
                  height: 10,
                ),
                addressTextFormField(),
                SizedBox(
                  height: 10,
                ),
                phoneTextFormField(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      //thay doi code
                      onPressed: () async {
                        // obtain shared preferences
                        prefs = await SharedPreferences.getInstance();
                        // prefs.setString('username', email.text);
                        // prefs.setString('password', password.text);
                        prefs.setString('fullname', fullname.text);
                        prefs.setString('address', address.text);
                        prefs.setString('phone', phone.text);
                        final result = await Navigator.pushNamed(
                            context, HomePage.routeName);
                        User user = result as User; //thay doi code
                        email.text = user.username!; //thay doi code
                        password.text = user.password!; //thay doi code
                      },
                      style: ElevatedButton.styleFrom(
                        //thay doi code
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.green,
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextFormField fullnameTextFormField() {
    return TextFormField(
      controller: fullname,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your full name ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.personal_injury_outlined)),
    );
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      controller: address,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your address ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.home_outlined)),
    );
  }

  TextFormField phoneTextFormField() {
    return TextFormField(
      controller: phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter phone number ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone_android_outlined)),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      enabled: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }

  TextFormField conformTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      enabled: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password ",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }
}
