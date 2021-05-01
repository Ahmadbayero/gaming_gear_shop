import 'package:flutter/material.dart';

class ShoppingCartBottomRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.yellow[600],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          ),
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
