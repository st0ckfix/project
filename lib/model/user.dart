class UserModel {
  final String id;
  final String avatar;
  final String name;

  UserModel({
    required this.id,
    required this.avatar,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avatar': avatar,
      'name': name,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      avatar: json['avatar'],
      name: json['name'],
    );
  }

  factory UserModel.empty() {
    return UserModel(
      id: '',
      avatar: '',
      name: '',
    );
  }
}
