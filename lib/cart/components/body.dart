import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/cart/components/checkoutcart.dart';
import 'package:foodnowapp/model/carts.dart';
import 'package:foodnowapp/model/products.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<CartItem> cartdetails = Cart().getCart();
  double sum = 0.0;
  var prefs;
  final value = TextEditingController();
  _getData(QuantityInput) async {
    prefs = await SharedPreferences.getInstance();
    var value = prefs.getInt();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartdetails.forEach((item) {
      sum = sum + item.quantity * item.product.price!.toDouble();
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartdetails.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: CartItem(
                          product: cartdetails[index].product,
                          quantity: cartdetails[index].quantity,
                        ),
                        onTap: () {
                          setState(() {
                            cartdetails.removeAt(index);
                            sum = 0.0;
                            cartdetails.forEach((item) {
                              sum = sum +
                                  item.quantity *
                                      item.product.price!.toDouble();
                            });
                          });
                        },
                      ),
                      Divider(),
                    ],
                  );
                }),
          ),
          CheckOutCart(
            sum: sum,
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Products product;
  int quantity;
  CartItem({required this.product, required this.quantity});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      padding: EdgeInsets.all(16),
      child: Row(children: [
        SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(product.image.toString())),
        Expanded(child: Text(product.title.toString())),
        Expanded(child: Text(product.price.toString())),
        Expanded(child: Text(quantity.toString())),
        Icon(Icons.delete_outlined),
      ]),
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
