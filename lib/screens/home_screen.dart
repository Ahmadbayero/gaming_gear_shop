import 'package:flutter/material.dart';
import 'package:gaming_gear_shop/models/controller.dart';
import 'package:gaming_gear_shop/screens/product_details_page.dart';
import 'package:gaming_gear_shop/shop_data.dart';
import 'package:gaming_gear_shop/widgets/accessories_tabBar.dart';
import 'package:gaming_gear_shop/widgets/on_display_prod.dart';
import 'package:gaming_gear_shop/widgets/rating_stars.dart';
import 'package:gaming_gear_shop/widgets/shopping_cart_bottom_right.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(Icons.drag_handle_sharp),
            onPressed: () {},
            color: Colors.black,
            iconSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[100],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Welcome to\nGaming Gear Shop',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            AccessoriesTabBar(
              startIndex: 0,
              tabItems: ['controllers', 'headsets', 'keyboards', 'speakers'],
              onTabChange: (int index) => print(index),
            ),
            OnDisplayProd(
              onDisplayProdData: onDisplay,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 15.0),
              child: Text(
                'New Arrival',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.black,
                  fontSize: 18.5,
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: newArrivals.length,
                itemBuilder: (BuildContext context, int index) {
                  Controller item = newArrivals[index];
                  return Container(
                    width: double.infinity,
                    height: 100.0,
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: item),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 280,
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(.2, .5),
                                      blurRadius: .6,
                                      // spreadRadius: .5
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 50.0, bottom: 5.0),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50.0, bottom: 5.0),
                                    child: RatingStars(
                                      rating: item.rating,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Text(
                                      '\$${item.price.toString()}',
                                      style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              child: Hero(
                                tag: item.imageURL[0],
                                child: Image(
                                  image: AssetImage(item.imageURL[0]),
                                  width: 120,
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          ShoppingCartBottomRight(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
