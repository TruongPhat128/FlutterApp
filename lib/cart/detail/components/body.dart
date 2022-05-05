import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/cart/detail/components/addtocart.dart';
import 'package:foodnowapp/model/products.dart';
import 'package:foodnowapp/model/catagories.dart';
import 'package:quiver/iterables.dart';
import 'package:quantity_input/quantity_input.dart';

class Body extends StatelessWidget {
  Products product;
  Body({required this.product});
  final cate = Categories.init();
  @override
  Widget build(BuildContext context) {
    var category = cate.firstWhere((item) => item.id == product.cateID);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Title: ${product.title}",
              style: TextStyle(fontSize: 20),
            ),
            flex: 1,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.asset(product.image.toString())),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text("Description: ${product.description}"),
            height: 180,
          ),
          Container(
              alignment: Alignment.center,
              child: SizedBox(
                child: QuantityInt(),
              )),
          Expanded(
            child: Text("Price: ${product.price}",
                style: TextStyle(
                  fontSize: 20,
                )),
            flex: 1,
          ),
          Expanded(
            child: Text("Category: ${category.title}",
                style: TextStyle(
                  fontSize: 20,
                )),
            flex: 1,
          ),
          AddProductToCart(
            product: product,
          )
        ],
      ),
    );
  }
}

class QuantityInt extends StatefulWidget {
  const QuantityInt({Key? key}) : super(key: key);

  @override
  State<QuantityInt> createState() => _QuantityIntState();
}

class _QuantityIntState extends State<QuantityInt> {
  int simpleIntInput = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: QuantityInput(
          value: simpleIntInput,
          onChanged: (value) => setState(
              () => simpleIntInput = int.parse(value.replaceAll('.', '')))),
    );
  }
}
