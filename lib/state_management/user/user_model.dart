import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  Id id;
  DateTime createdAt;
  String email;
  dynamic image;
  String name;
  String passwordDigest;
  String role;
  DateTime updatedAt;
  String username;

  User({
    this.id,
    this.createdAt,
    this.email,
    this.image,
    this.name,
    this.passwordDigest,
    this.role,
    this.updatedAt,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => new User(
        id: Id.fromJson(json["_id"]),
        createdAt: DateTime.parse(json["created_at"]),
        email: json["email"],
        image: json["image"],
        name: json["name"],
        passwordDigest: json["password_digest"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "created_at": createdAt.toIso8601String(),
        "email": email,
        "image": image,
        "name": name,
        "password_digest": passwordDigest,
        "role": role,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
      };
}

class Id {
  String oid;

  Id({
    this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => new Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}
