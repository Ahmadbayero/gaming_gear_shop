class Controller {
  Controller({
    this.name,
    this.rating,
    this.price,
    this.imageURL,
    this.productCategory,
    this.productInfo,
  }) : assert(
          name != null && price != null && imageURL != null,
        );

  final String name;
  final double rating;
  final int price;
  final List<String> imageURL;
  final String productCategory;
  final String productInfo;
}
