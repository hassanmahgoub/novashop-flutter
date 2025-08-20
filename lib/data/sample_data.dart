import '../models/product.dart';

class SampleData {
  static List<Banner> getBanners() {
    return [
      Banner(
        id: '1',
        title: 'Summer Sale',
        subtitle: 'Up to 50% off on all items',
        imageUrl: 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800',
        actionText: 'Shop Now',
        actionRoute: '/sale',
      ),
      Banner(
        id: '2',
        title: 'New Collection',
        subtitle: 'Discover the latest trends',
        imageUrl: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=800',
        actionText: 'Explore',
        actionRoute: '/new',
      ),
      Banner(
        id: '3',
        title: 'Free Shipping',
        subtitle: 'On orders over \$50',
        imageUrl: 'https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=800',
        actionText: 'Learn More',
        actionRoute: '/shipping',
      ),
    ];
  }

  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'Fashion',
        imageUrl: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400',
        iconData: 'checkroom',
      ),
      Category(
        id: '2',
        name: 'Electronics',
        imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
        iconData: 'devices',
      ),
      Category(
        id: '3',
        name: 'Home & Garden',
        imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
        iconData: 'home',
      ),
      Category(
        id: '4',
        name: 'Sports',
        imageUrl: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400',
        iconData: 'sports_soccer',
      ),
      Category(
        id: '5',
        name: 'Beauty',
        imageUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400',
        iconData: 'face_retouching_natural',
      ),
      Category(
        id: '6',
        name: 'Books',
        imageUrl: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400',
        iconData: 'menu_book',
      ),
    ];
  }

  static List<Product> getFeaturedProducts() {
    return [
      Product(
        id: '1',
        name: 'Wireless Headphones',
        description: 'Premium quality wireless headphones with noise cancellation',
        price: 199.99,
        originalPrice: 249.99,
        imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
        category: 'Electronics',
        rating: 4.5,
        reviewCount: 128,
        isOnSale: true,
        discountPercentage: 20,
        colors: ['Black', 'White', 'Blue'],
      ),
      Product(
        id: '2',
        name: 'Designer Handbag',
        description: 'Elegant leather handbag perfect for any occasion',
        price: 299.99,
        originalPrice: 299.99,
        imageUrl: 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
        category: 'Fashion',
        rating: 4.8,
        reviewCount: 89,
        colors: ['Brown', 'Black', 'Tan'],
      ),
      Product(
        id: '3',
        name: 'Smart Watch',
        description: 'Advanced fitness tracking and smart notifications',
        price: 349.99,
        originalPrice: 399.99,
        imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
        category: 'Electronics',
        rating: 4.6,
        reviewCount: 203,
        isOnSale: true,
        discountPercentage: 12,
        colors: ['Silver', 'Gold', 'Space Gray'],
      ),
      Product(
        id: '4',
        name: 'Running Shoes',
        description: 'Comfortable and durable running shoes for all terrains',
        price: 129.99,
        originalPrice: 159.99,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        category: 'Sports',
        rating: 4.4,
        reviewCount: 156,
        isOnSale: true,
        discountPercentage: 19,
        sizes: ['7', '8', '9', '10', '11'],
        colors: ['White', 'Black', 'Red'],
      ),
    ];
  }

  static List<Product> getBestSellers() {
    return [
      Product(
        id: '5',
        name: 'Coffee Maker',
        description: 'Professional grade coffee maker for perfect brew',
        price: 89.99,
        originalPrice: 89.99,
        imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
        category: 'Home & Garden',
        rating: 4.7,
        reviewCount: 342,
      ),
      Product(
        id: '6',
        name: 'Skincare Set',
        description: 'Complete skincare routine with natural ingredients',
        price: 79.99,
        originalPrice: 99.99,
        imageUrl: 'https://images.unsplash.com/photo-1556228578-0d85b1a4d571?w=400',
        category: 'Beauty',
        rating: 4.9,
        reviewCount: 267,
        isOnSale: true,
        discountPercentage: 20,
      ),
      Product(
        id: '7',
        name: 'Bluetooth Speaker',
        description: 'Portable speaker with amazing sound quality',
        price: 59.99,
        originalPrice: 79.99,
        imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400',
        category: 'Electronics',
        rating: 4.3,
        reviewCount: 198,
        isOnSale: true,
        discountPercentage: 25,
      ),
      Product(
        id: '8',
        name: 'Yoga Mat',
        description: 'Non-slip yoga mat for comfortable practice',
        price: 39.99,
        originalPrice: 39.99,
        imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400',
        category: 'Sports',
        rating: 4.5,
        reviewCount: 124,
      ),
    ];
  }

  static List<Product> getNewArrivals() {
    return [
      Product(
        id: '9',
        name: 'Vintage Camera',
        description: 'Classic film camera for photography enthusiasts',
        price: 449.99,
        originalPrice: 449.99,
        imageUrl: 'https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=400',
        category: 'Electronics',
        rating: 4.6,
        reviewCount: 45,
      ),
      Product(
        id: '10',
        name: 'Leather Jacket',
        description: 'Genuine leather jacket with modern styling',
        price: 199.99,
        originalPrice: 249.99,
        imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400',
        category: 'Fashion',
        rating: 4.4,
        reviewCount: 67,
        isOnSale: true,
        discountPercentage: 20,
      ),
    ];
  }
}
