class CategoryModel {
  final String name, image;

  CategoryModel({required this.name, required this.image});
}

List<CategoryModel> categoriesList = [
  CategoryModel(name: "Women", image: "assets/images/app_logo.png"),
  CategoryModel(name: "Men", image: "assets/images/app_logo.png"),
  CategoryModel(name: "Kids", image: "assets/images/app_logo.png"),
  CategoryModel(name: "Teens", image: "assets/images/app_logo.png"),
  CategoryModel(name: "Baby", image: "assets/images/app_logo.png"),
];

List<String> filterCategory = [
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
