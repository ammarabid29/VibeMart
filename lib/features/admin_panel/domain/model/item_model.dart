class ItemModel {
  final String name;
  final int price;
  final String imageUrl;
  final String uploadedBy;
  final String category;
  final List<String> size;
  final List<String> color;
  final bool isDiscounted;
  final int discountPercentage;

  ItemModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.uploadedBy,
    required this.category,
    required this.size,
    required this.color,
    required this.isDiscounted,
    required this.discountPercentage,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "price": price,
      "imageUrl": imageUrl,
      "uploadedBy": uploadedBy,
      "category": category,
      "size": size,
      "color": color,
      "isDiscounted": isDiscounted,
      "discountPercentage": discountPercentage,
    };
  }
}
