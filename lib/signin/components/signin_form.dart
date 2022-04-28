import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/homepage/homepage.dart';
import 'package:foodnowapp/model/user.dart';
import 'package:foodnowapp/model/utilities.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../signup/signuppage.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();

  late FToast fToast; //thay doi code
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
    _checkData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username').isEmpty) {
      username.text = prefs.getString('username');
      password.text = prefs.getString('password');
      _value = prefs.getBool('check');
      //print(_value.toString());
    }
  }

  _checkData() async {
    prefs = await SharedPreferences.getInstance();
    var username_prefs = prefs.getString('username');
    var password_prefs = prefs.getString('password');
    if (username.text == username_prefs && password.text == password_prefs) {
      Navigator.pushNamed(context, HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Food Now",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        return Utilities.validatePassword(
                            value!); //thay doi code
                      },
                      onSaved: (_value) {
                        setState(() {
                          username.text = _value!; //thay doi code
                        });
                      },
                      controller: username,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          prefixIcon: Icon(Icons.mail_outline)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        return Utilities.validatePassword(
                            value!); //thay doi code
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Row(
                    //   children: [
                    //     Checkbox(value: _value?? : true, onChanged: (value)  {
                    //       print(_value.toString());
                    //       setState((){
                    //         _value = value;
                    //       });
                    //     }),
                    //     Text("Remember me", style: TextStyle(fontSize: 16, color: Colors.green),)
                    //   ],
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        //thay doi code
                        onPressed: () async {
                          if (_value) {
                            // obtain shared preferences
                            prefs = await SharedPreferences.getInstance();
                            prefs.setString('username', username.text);
                            prefs.setString('password', password.text);
                            prefs.setBool('check', _value);
                          } else {
                            prefs.remove('check');
                          }

                          Navigator.pushNamed(context, HomePage.routeName);
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
                      height: 5,
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
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("assets/icons/facebook-2.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                "assets/icons/google-icon.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("assets/icons/twitter.svg"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(color: Colors.green, fontSize: 14),
                        ),
                        GestureDetector(
                            onTap: () async {
                              final result = await Navigator.pushNamed(
                                  context, SignUpPage.routeName);
                              User user = result as User; //thay doi code
                              username.text = user.username!; //thay doi code
                              password.text = user.password!;
                            },
                            child: Text(
                              " Sign Up",
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 14),
                            ))
                      ],
                    )
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
