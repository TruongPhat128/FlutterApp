import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/homepage/homepage.dart';
import 'components/body.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = "/category_detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Category Details"),
      ),
      body: Body(ModalRoute.of(context)!.settings.arguments as int),
    );
  }
}
