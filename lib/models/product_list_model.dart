class ProductList {
  ProductList(
      {required this.imagePath,
      required this.name,
      required this.price,
      required this.weight,
      required this.calories,
      required this.vitamins,
      required this.avail});

  final String imagePath;
  final String name;
  final int price;
  final List<dynamic> weight;
  final List<dynamic> calories;
  final List<dynamic> vitamins;
  final List<dynamic> avail;
}
