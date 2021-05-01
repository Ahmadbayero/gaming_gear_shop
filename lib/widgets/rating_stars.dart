
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  
  const RatingStars({Key key, this.rating, this.fontSize: 17.0}) : super(key: key);
  final double rating;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    
    String stars = '';

    for (int i = 0; i < this.rating; i++) {
      stars += '⭐  ';
    }
    stars.trim();
    return Text(stars, style: TextStyle(fontSize: fontSize),);
  }
}