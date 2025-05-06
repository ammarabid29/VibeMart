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

  Map<String, dynamic> toJson() {
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

  factory ItemModel.fromJson(Map<String, dynamic> map) {
    return ItemModel(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      uploadedBy: map['uploadedBy'] ?? '',
      category: map['category'] ?? '',
      size: List<String>.from(map['size'] ?? []),
      color: List<String>.from(map['color'] ?? []),
      isDiscounted: map['isDiscounted'] ?? false,
      discountPercentage: map['discountPercentage'] ?? 0,
    );
  }
}
