class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final bool isOnSale;
  final int discountPercentage;
  final List<String> colors;
  final List<String> sizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
    this.isOnSale = false,
    this.discountPercentage = 0,
    this.colors = const [],
    this.sizes = const [],
  });

  double get discountAmount => originalPrice - price;
  bool get hasDiscount => originalPrice > price;
}

class Category {
  final String id;
  final String name;
  final String imageUrl;
  final String iconData;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.iconData,
  });
}

class Banner {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String actionText;
  final String actionRoute;

  Banner({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.actionText,
    required this.actionRoute,
  });
}
