import 'dart:ui';

class ShopItemModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;
  final List<Color> fColor;
  final List<String> size;
  final bool isCheck;

  ShopItemModel({
    required this.name,
    required this.image,
    required this.description,
    required this.category,
    required this.rating,
    required this.review,
    required this.price,
    required this.fColor,
    required this.size,
    required this.isCheck,
  });
}

List<ShopItemModel> shopItemsList = [
  ShopItemModel(
    name: "Men's Casual Shirt",
    image: "assets/images/logo.png",
    description: "Comfortable cotton shirt for everyday wear.",
    category: "Men",
    rating: 4.5,
    review: 180,
    price: 2500,
    fColor: [Color(0xFF37474F), Color(0xFF607D8B)],
    size: ["M", "L", "XL"],
    isCheck: true,
  ),
  ShopItemModel(
    name: "Casual Shirt pant",
    image: "assets/images/logo.png",
    description: "Comfortable cotton shirt for everyday wear.",
    category: "Men",
    rating: 4.5,
    review: 180,
    price: 2500,
    fColor: [Color(0xFF37474F), Color(0xFF607D8B)],
    size: ["M", "L", "XL"],
    isCheck: true,
  ),
  ShopItemModel(
    name: "Women's Floral Dress",
    image: "assets/images/logo.png",
    description: "Elegant floral dress perfect for summer outings.",
    category: "Women",
    rating: 4.7,
    review: 230,
    price: 3200,
    fColor: [Color(0xFFFFC1E3), Color(0xFFFF8A80)],
    size: ["S", "M", "L"],
    isCheck: false,
  ),
  ShopItemModel(
    name: "Kids' Cartoon T-Shirt",
    image: "assets/images/logo.png",
    description: "Colorful cartoon printed t-shirt for kids.",
    category: "Kids",
    rating: 4.6,
    review: 140,
    price: 900,
    fColor: [Color(0xFFFFF176), Color(0xFFFFD54F)],
    size: ["XS", "S", "M"],
    isCheck: false,
  ),
  ShopItemModel(
    name: "Teens' Hoodie",
    image: "assets/images/logo.png",
    description: "Trendy hoodie with a cool print for teens.",
    category: "Teens",
    rating: 4.4,
    review: 160,
    price: 2700,
    fColor: [Color(0xFF546E7A), Color(0xFF90A4AE)],
    size: ["M", "L", "XL"],
    isCheck: false,
  ),
  ShopItemModel(
    name: "Baby Romper",
    image: "assets/images/logo.png",
    description: "Soft and comfy romper for your little one.",
    category: "Baby",
    rating: 4.8,
    review: 200,
    price: 1100,
    fColor: [Color(0xFFFFF9C4), Color(0xFFFFECB3)],
    size: ["0-3M", "3-6M", "6-12M"],
    isCheck: false,
  ),
];
