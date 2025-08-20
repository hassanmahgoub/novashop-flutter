import '../models/user.dart';

class UserData {
  static User getSampleUser() {
    return User(
      id: 'user_001',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+1 (555) 123-4567',
      profileImageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=400',
      dateOfBirth: DateTime(1990, 5, 15),
      gender: 'Male',
      createdAt: DateTime(2023, 1, 15),
      isEmailVerified: true,
      isPhoneVerified: true,
      defaultAddress: Address(
        id: 'addr_001',
        label: 'Home',
        fullName: 'John Doe',
        addressLine1: '123 Main Street',
        addressLine2: 'Apt 4B',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        country: 'United States',
        phoneNumber: '+1 (555) 123-4567',
        isDefault: true,
      ),
      addresses: [
        Address(
          id: 'addr_001',
          label: 'Home',
          fullName: 'John Doe',
          addressLine1: '123 Main Street',
          addressLine2: 'Apt 4B',
          city: 'New York',
          state: 'NY',
          zipCode: '10001',
          country: 'United States',
          phoneNumber: '+1 (555) 123-4567',
          isDefault: true,
        ),
        Address(
          id: 'addr_002',
          label: 'Work',
          fullName: 'John Doe',
          addressLine1: '456 Business Ave',
          city: 'New York',
          state: 'NY',
          zipCode: '10002',
          country: 'United States',
          phoneNumber: '+1 (555) 987-6543',
          isDefault: false,
        ),
      ],
      preferences: UserPreferences(
        emailNotifications: true,
        pushNotifications: true,
        smsNotifications: false,
        currency: 'USD',
        language: 'English',
        darkMode: false,
      ),
    );
  }

  static List<Map<String, dynamic>> getOrderHistory() {
    return [
      {
        'id': 'ORD-001',
        'date': DateTime(2024, 1, 15),
        'status': 'Delivered',
        'total': 299.99,
        'items': 3,
        'trackingNumber': 'TRK123456789',
      },
      {
        'id': 'ORD-002',
        'date': DateTime(2024, 1, 10),
        'status': 'In Transit',
        'total': 159.99,
        'items': 2,
        'trackingNumber': 'TRK987654321',
      },
      {
        'id': 'ORD-003',
        'date': DateTime(2024, 1, 5),
        'status': 'Processing',
        'total': 89.99,
        'items': 1,
        'trackingNumber': null,
      },
      {
        'id': 'ORD-004',
        'date': DateTime(2023, 12, 28),
        'status': 'Delivered',
        'total': 449.99,
        'items': 4,
        'trackingNumber': 'TRK456789123',
      },
    ];
  }

  static Map<String, dynamic> getAccountStats() {
    return {
      'totalOrders': 12,
      'totalSpent': 1299.99,
      'memberSince': DateTime(2023, 1, 15),
      'loyaltyPoints': 2450,
      'wishlistItems': 8,
      'reviewsWritten': 5,
    };
  }
}
