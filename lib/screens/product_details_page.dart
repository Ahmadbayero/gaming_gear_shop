import 'package:flutter/material.dart';
import 'package:gaming_gear_shop/widgets/preview_image.dart';
import 'package:gaming_gear_shop/widgets/rating_stars.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key key, this.product}) : super(key: key);
  final product;

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String heroImage = '';

  @override
  void initState() {
    heroImage = widget.product.imageURL[0];
    super.initState();
  }

  _handleState(String image) {
    setState(() {
      heroImage = image;
      print(heroImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              height: 360,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/product_details_background.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    left: 10.0,
                    right: 10.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border_outlined),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () {
                            print(MediaQuery.of(context).size.width);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Hero(
                        tag: widget.product.imageURL[0],
                        child: Image(
                          image: AssetImage(
                              heroImage ?? widget.product.imageURL[0]),
                          width: 320.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  PreviewImage(
                    image: widget.product.imageURL[i] ??
                        widget.product.imageURL[0],
                    onPressed: (image) => _handleState(image),
                  ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              margin: EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontFamily: 'Kanit',
                          letterSpacing: .8,
                        ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.product.productCategory,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 14.5,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  RatingStars(
                    rating: widget.product.rating,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    widget.product.productInfo,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.product.price}',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontFamily: 'Kanit',
                          letterSpacing: .8,
                        ),
                  ),
                  FlatButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.blueAccent,
                    onPressed: () {},
                    child: Text(
                      'ADD TO CART',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontFamily: 'Kanit',
                          letterSpacing: .8,
                          color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
