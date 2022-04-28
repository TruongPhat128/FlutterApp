import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodnowapp/model/products.dart';

class FavoriteDetail extends StatelessWidget {
  List<Products> products;

  FavoriteDetail(this.products);

  @override
  Widget build(BuildContext context) {
    final Map<int, Products> uniqueArr = new Map();
    products.forEach((p) {
      uniqueArr[p.cateID as int] = p;
    });
    products = uniqueArr.values.toSet().toList();
    print(products);
    return Expanded(
      child: Container(
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItemList(
                product: products[index],
              );
            }),
      ),
    );
  }
}

class ProductItemList extends StatelessWidget {
  Products product;

  ProductItemList({required this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                product.image.toString(),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title.toString()),
                      Expanded(
                          child: Text(
                        product.description.toString(),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
