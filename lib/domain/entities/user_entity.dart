abstract class UserEntity {
  UserEntity({
    this.id,
    required this.email,
    required this.name,
    required this.lastName,
  });
  final String? id;
  final String email;
  final String name;
  final String lastName;

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
      };
}
