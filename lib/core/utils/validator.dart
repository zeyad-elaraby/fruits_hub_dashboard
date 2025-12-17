import 'dart:io';

class MyValidators {
  // Generic validator for any field
  static String? genericValidator({
    String? value,
    String? fieldName,
    int? minLength,
    int? maxLength,
    bool isRequired = true,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return '${fieldName ?? 'Field'} cannot be empty';
    }
    if (value != null && minLength != null && value.length < minLength) {
      return '${fieldName ?? 'Field'} must be at least $minLength characters long';
    }
    if (value != null && maxLength != null && value.length > maxLength) {
      return '${fieldName ?? 'Field'} must be at most $maxLength characters long';
    }
    return null;
  }

  // Price validator
  static String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a price';
    }
    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid price';
    }
    if (price < 0) {
      return 'Price cannot be negative';
    }
    if (price == 0) {
      return 'Price must be greater than zero';
    }
    return null;
  }

  // Age validator
  static String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an age';
    }
    final age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid age';
    }
    if (age < 0) {
      return 'Age cannot be negative';
    }
    if (age > 150) {
      return 'Please enter a valid age';
    }
    if (age < 18) {
      return 'You must be at least 18 years old';
    }
    return null;
  }

  // Quantity validator
  static String? quantityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a quantity';
    }
    final quantity = int.tryParse(value);
    if (quantity == null) {
      return 'Please enter a valid quantity';
    }
    if (quantity < 1) {
      return 'Quantity must be at least 1';
    }
    return null;
  }

  // URL validator
  static String? urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a URL';
    }
    if (!RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    ).hasMatch(value)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(
      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b',
    ).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone';
    }
    if (!value.startsWith('010')) {
      return 'Phone number must start with 010';
    }
    if (value.length < 11 || value.length > 11) {
      return 'Phone must be at least 11 characters long';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? nationalIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a national ID';
    }
    if (value.length < 14 || value.length > 14) {
      return 'National ID must be at least 14 characters long';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? genderValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return 'Please enter gender';
    }
    return null;
  }

  static String? imageValidator(String? image) {
    if (image == null || image.isEmpty) {
      return 'Image cannot be empty';
    }
    return null;
  }

  static String? imageFileValidator(File? imageFile) {
    if (imageFile == null) {
      return 'Please select an image';
    }
    return null;
  }

  static String? tokenValidator(String? val) {
    if (val == null || val.isEmpty) {
      return 'Token cannot be empty';
    }
    return null;
  }
}
