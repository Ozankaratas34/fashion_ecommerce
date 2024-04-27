class Product {
  int id;
  String imagePath;
  String title;
  String description;
  double price;
  bool isFavorite;
  int stockAmount;
  List<Commit> commits = [
    Commit(
        userImagePath: 'lib/assets/images/user1.jpg',
        userName: 'James Worth',
        date: DateTime.now(),
        rate: 4,
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis"),
    Commit(
        userImagePath: 'lib/assets/images/user2.jpg',
        userName: 'Mike Kev',
        date: DateTime.now(),
        rate: 5,
        content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis"),
  ];

  Product(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price,
      required this.isFavorite,
      required this.stockAmount});
}

class Commit {
  String userImagePath;
  String userName;
  DateTime date;
  int rate;
  String content;

  Commit(
      {required this.userImagePath,
      required this.userName,
      required this.date,
      required this.rate,
      required this.content});
}

class Order {
  Product product;
  DateTime date;
  String status;

  Order({required this.product, required this.date, required this.status});
}
