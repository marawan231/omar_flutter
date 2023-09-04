// ignore_for_file: prefer_const_declarations

final String usersTable = 'users';

class UsersField {
  static final List<String> values = [
    id,
    userName,
    userEmail,
    phone,
    password,
    age,
    height,
    weight,

  ];

  static final String id = '_id';
  static final String userName = 'userName';
  static final String userEmail = 'userEmail';
  static final String phone = 'phone';
  static final String password = 'password';
  static final String age = 'age';
  static final String height = 'height';
  static final String weight = 'weight';


}

class User {
  final int? id;
  final String? userName;
  final String? userEmail;
  final String? phone;
  final String? password;
  final String? age;
  final String? height;
  final String? weight;

  User({
    this.userName,
    this.userEmail ,
    this.phone ,
    this.password ,
    this.age ,
    this.id,
    this.height,
    this.weight,
  });

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UsersField.id] as int?,
        userName: json[UsersField.userName] as String?,
        userEmail: json[UsersField.userEmail] as String?,
        phone: json[UsersField.phone] as String?,
        password: json[UsersField.password] as String?,
        age: json[UsersField.age] as String?,
        height: json[UsersField.height] as String?,
        weight: json[UsersField.weight] as String?,

        // taskRepeatTime: json[UsersField.taskRepeatTime] as String?,
        // isCompleted: json[UsersField.isCompleted] == 1,
        // isFavourite: json[UsersField.isFavourite] == 1,
      );

  Map<String, Object?> toJson() => {
        UsersField.userName: userName,
        UsersField.userEmail: userEmail,
        UsersField.phone: phone,
        UsersField.password: password,
        UsersField.age: age,
        UsersField.id: id,
        UsersField.height: height,
        UsersField.weight: weight,
      };

  User copy({
    int? id,
    final String? userName,
    final String? userEmail,
    final String? phone,
    final String? password,
    final String? age,
    final String? height,
    final String? weight,
  }) =>
      User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        userEmail: userEmail ?? this.userEmail,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        age: age ?? this.age,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        // taskTitle: taskTitle ?? this.taskTitle,
      );
}
