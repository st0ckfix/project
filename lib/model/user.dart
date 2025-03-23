class UserModel {
  final String id;
  final String avatar;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.avatar,
    required this.firstName,
    required this.lastName,
  });

  UserModel copyWith({
    String? id,
    String? avatar,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      avatar: json['avatar'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  factory UserModel.empty() {
    return UserModel(
      id: '',
      avatar: '',
      firstName: '',
      lastName: '',
    );
  }
}
