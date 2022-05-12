import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/model/products.dart';
import 'package:foodnowapp/signin/components/signin_form.dart';

import '../../../cart/components/body.dart';
import '../../../model/carts.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
  static String routeName = "./notification";
}

class _NotificationPageState extends State<NotificationPage> {
  List<CartItem> cartdetails = Cart().getCart().toList();
  double sum = 0.0;

  @override
  void initState() {
    // TODO: implement initState
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
                        child: Item(
                          product: cartdetails[index].product,
                          quantity: cartdetails[index].quantity,
                        ),
                        onTap: () {},
                      ),
                    ],
                  );
                }),
          ),
          Expanded(child: Prices(sum: sum)),
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

class Item extends StatelessWidget {
  Products product;
  int quantity;

  Item({required this.product, required this.quantity});

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
        Expanded(child: Text("Giá: ${product.price.toString()}")),
        Expanded(child: Text("Số lượng: ${quantity.toString()}")),
      ]),
    );
  }
}

class Prices extends StatelessWidget {
  double sum;
  Prices({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.white,
            textColor: Colors.green,
            onPressed: () {},
            child: Text(
              "Tổng tiền: ${sum}",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
