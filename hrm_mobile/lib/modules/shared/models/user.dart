class UserModel {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String role;
  UserModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.role
  });

  factory UserModel.fromSqfliteDatabase(Map<String, dynamic> map) => UserModel(
    id: map['id'] ?? '', 
    firstName: map['firstName'] ?? '', 
    middleName: map['middleName'] ?? '', 
    lastName: map['lastName'] ?? '', 
    role: map['role'] ?? ''
  );
}