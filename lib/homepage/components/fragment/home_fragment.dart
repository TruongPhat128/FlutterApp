import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_fragment_categories.dart';
import 'home_fragment_product.dart';

class HomeDetail extends StatelessWidget {
  static String routeName = "/Home_Menu";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [CategoriesStore(), ProductPopular()],
      ),
    );
  }
}
