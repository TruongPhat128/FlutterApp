import 'dart:convert';

import 'package:foodnowapp/model/products.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';

class Utilities {
  String url = 'http://192.168.0.100:3000/api/food';

  static List<Products> data = [];

  Future<List<Products>> getProducts() async {
    var res = await http.get(Uri.parse(url)); //thay doi code
    if (res.statusCode == 200) {
      var content = res.body;
      print(content.toString());
      var arr = json.decode(content)['food'] as List;

      // for every element of arr map to _fromJson
      // and convert the array to list

      return arr.map((e) => _fromJson(e)).toList();
    }

    return List<Products>.empty(); //thay doi code
  }

  Products _fromJson(Map<String, dynamic> item) {
    return new Products(
        description: item['description'],
        title: item['title'],
        image: item['image'],
        price: double.parse(item['price']));
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'); //thay doi code
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters ';
    }
  }

  static String? conformPassword(String value, String value2) {
    if (!equalsIgnoreCase(value, value2)) {
      return "Confirm password invalid";
    }
  }

  List<Products> getProductFormCate(int id) {
    var data = Products.init();
    return data.where((p) => p.cateID == id).toList();
  }
}
