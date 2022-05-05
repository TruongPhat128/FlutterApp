import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/model/products.dart';
import 'package:foodnowapp/signin/components/signin_form.dart';

import '../../../model/carts.dart';

class NotificationPage extends StatelessWidget {
  List<Products> cartdetails = Cart().getCart();
  double sum = 0.0;
  static String routeName = "./notification";

  @override
  void initState() {
    // TODO: implement initState
    cartdetails.forEach((product) {
      sum = sum + product.price!.toInt();
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
                          product: cartdetails[index],
                        ),
                        onTap: () {},
                      ),
                      Divider(),
                    ],
                  );
                }),
          ),
          Expanded(
              child: Text("Đang chờ giao hàng",
                  style: TextStyle(
                    fontSize: 20,
                  ))),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  Products product;
  CartItem({required this.product});

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
        Expanded(child: Text("Price: ${product.price.toString()}")),
      ]),
    );
  }
}
