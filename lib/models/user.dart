class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime? dateOfBirth;
  final String? gender;
  final Address? defaultAddress;
  final List<Address> addresses;
  final DateTime createdAt;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final UserPreferences preferences;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
    this.defaultAddress,
    this.addresses = const [],
    required this.createdAt,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    required this.preferences,
  });

  String get fullName => '$firstName $lastName';
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();
}

class Address {
  final String id;
  final String label; // Home, Work, etc.
  final String fullName;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String? phoneNumber;
  final bool isDefault;

  Address({
    required this.id,
    required this.label,
    required this.fullName,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.phoneNumber,
    this.isDefault = false,
  });

  String get fullAddress {
    final line2 = addressLine2?.isNotEmpty == true ? '\n$addressLine2' : '';
    return '$addressLine1$line2\n$city, $state $zipCode\n$country';
  }
}

class UserPreferences {
  final bool emailNotifications;
  final bool pushNotifications;
  final bool smsNotifications;
  final String currency;
  final String language;
  final bool darkMode;

  UserPreferences({
    this.emailNotifications = true,
    this.pushNotifications = true,
    this.smsNotifications = false,
    this.currency = 'USD',
    this.language = 'English',
    this.darkMode = false,
  });

  UserPreferences copyWith({
    bool? emailNotifications,
    bool? pushNotifications,
    bool? smsNotifications,
    String? currency,
    String? language,
    bool? darkMode,
  }) {
    return UserPreferences(
      emailNotifications: emailNotifications ?? this.emailNotifications,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
      currency: currency ?? this.currency,
      language: language ?? this.language,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
