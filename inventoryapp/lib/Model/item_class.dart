class Item{
  int id;
  final String name;
  final String category;
  final String price;
  final String margin;
  String quantity;

  static int I_ID=1;
  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.margin,
    required this.quantity,
  });

}