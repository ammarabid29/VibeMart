class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});

  // Factory constructor to create a CategoryModel from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  // Method to convert CategoryModel to JSON
  Map<String, dynamic> toJson() {
    return {'name': name, 'image': image};
  }
}
//
// List<CategoryModel> categoriesList = [
//   CategoryModel(name: "Women", image: "assets/images/app_logo.png"),
//   CategoryModel(name: "Men", image: "assets/images/app_logo.png"),
//   CategoryModel(name: "Kids", image: "assets/images/app_logo.png"),
//   CategoryModel(name: "Teens", image: "assets/images/app_logo.png"),
//   CategoryModel(name: "Baby", image: "assets/images/app_logo.png"),
// ];

List<String> filterCategory = [
  "Filter",
  "Ratings",
  "Size",
  "Color",
  "Price",
  "Brand",
];
