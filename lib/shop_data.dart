import 'package:gaming_gear_shop/models/controller.dart';

Controller onDisplay = Controller(
  name: 'Dualshock 5 space custom',
  rating: 4,
  price: 60,
  imageURL: ['assets/images/space_custom_controller.png', null, null, null],
  productCategory: 'Playstation',
  productInfo: controllerInfo,
);

String controllerInfo =
    '''The dualshock wireless controller for PS5 gives you what you want in your gaming from precision control over your games to sharing the best gaming experience with the oncontroller headphone jack ...''';

List<Controller> newArrivals = [
  Controller(
    name: 'Dualshock 5 pure white',
    rating: 4,
    price: 60,
    imageURL: [
      'assets/images/white_controller.png',
      'assets/images/white_controller1.png',
      'assets/images/white_controller2.png',
      'assets/images/white_controller4.png',
    ],
    productCategory: 'Playstation',
    productInfo: controllerInfo,
  ),
  Controller(
    name: 'Dualshock 5 Jet black',
    rating: 4,
    price: 55,
    imageURL: [
      'assets/images/black_controller2.png',
      'assets/images/black_controller1.png',
      null,
      null
    ],
    productCategory: 'Playstation',
    productInfo: controllerInfo,
  ),
  Controller(
    name: 'Dualshock 4 f-standard',
    rating: 5,
    price: 60,
    imageURL: ['assets/images/f-standard-red_controller.png', null, null, null],
    productCategory: 'Playstation',
    productInfo: controllerInfo,
  )
];
