import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/homepage/components/fragment/notification_fragment.dart';
import 'package:foodnowapp/homepage/components/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutCart extends StatelessWidget {
  double sum;
  CheckOutCart({required this.sum});
  var prefs;
  final value = TextEditingController();
  _getData(QuantityInput) async {
    prefs = await SharedPreferences.getInstance();
    var value = prefs.getInt();
  }

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
              "Sum:${sum}",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            onPressed: () async {
              Navigator.pushNamed(context, ThankYouPage.routeName);
            },
            color: Colors.green,
            textColor: Colors.white,
            child:
                Text("Check out".toUpperCase(), style: TextStyle(fontSize: 14)),
          ),
        )
      ],
    );
  }
}
