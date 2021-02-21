class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final products = [
  Item(
      id: "Codepur001",
      name: "iphone 12 Pro",
      desc: "Apple iphone 12th gen",
      color: "#33505a",
      image: "https://unsplash.com/photos/2yIcl0B1LOw")
];
