import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gaming_gear_shop/widgets/rating_stars.dart';
import 'package:gaming_gear_shop/widgets/shopping_cart_bottom_right.dart';

class OnDisplayProd extends StatelessWidget {
  const OnDisplayProd({Key key, this.onDisplayProdData}) : super(key: key);
  final dynamic onDisplayProdData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
      height: 170.0,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 10),
            spreadRadius: 3.0,
            blurRadius: 20.0
          ),
        ],
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 15.0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${onDisplayProdData.name.split(" ").sublist(0, 2).join(" ")}\n${onDisplayProdData.name.split(" ").sublist(2).join(" ")}',
                      style: _cardTextStyle(context, fontSize: 20.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: RatingStars(
                      rating: onDisplayProdData.rating,
                    ),
                  ),
                  Text(
                    '\$${onDisplayProdData.price}',
                    style: _cardTextStyle(context, fontSize: 26),
                  ),
                ]),
          ),
          Positioned(
              right: -20,
              top: -20,
              child: Transform.rotate(
                angle: -(pi / 7),
                child: Image(
                  image: AssetImage(onDisplayProdData.imageURL[0]),
                  width: 165.0,
                  height: 130.0,
                ),
              )),
          ShoppingCartBottomRight(),
        ],
      ),
    );
  }

  TextStyle _cardTextStyle(BuildContext context,
          {double fontSize: 18, Color color: Colors.white}) =>
      Theme.of(context).textTheme.caption.copyWith(
          fontFamily: 'Kanit',
          fontSize: fontSize,
          color: color,
          height: 1.1,
          letterSpacing: .8,
          fontWeight: FontWeight.w600);
}
