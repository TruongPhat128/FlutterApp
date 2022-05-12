import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/cart/detail/components/addtocart.dart';
import 'package:foodnowapp/model/products.dart';
import 'package:foodnowapp/model/catagories.dart';
import 'package:quiver/iterables.dart';
import 'package:quantity_input/quantity_input.dart';

class Body extends StatefulWidget {
  Products product;
  Body({required this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cate = Categories.init();
  int simpleIntInput = 1;
  @override
  Widget build(BuildContext context) {
    var category = cate.firstWhere((item) => item.id == widget.product.cateID);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Title: ${widget.product.title}",
              style: TextStyle(fontSize: 20),
            ),
            flex: 1,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.asset(widget.product.image.toString())),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text("Description: ${widget.product.description}"),
            height: 180,
          ),
          Container(
              alignment: Alignment.center,
              child: SizedBox(
                child: QuantityInput(
                  value: simpleIntInput,
                  onChanged: (value) => setState(() =>
                      simpleIntInput = int.parse(value.replaceAll('.', ''))),
                ),
              )),
          Expanded(
            child: Text("Price: ${widget.product.price}",
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
            product: widget.product,
            quantity: simpleIntInput,
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
    return Container();
  }
}
