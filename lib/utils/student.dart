// ignore_for_file: non_constant_identifier_names

String tableStudent = 'students';

class StudentFields {
  static final List<String> values = [
    id,
    studentId,
    firstName,
    middleName,
    lastName
  ];
  static const String id = '_id';
  static const String studentId = 'studentId';
  static const String firstName = 'firstName';
  static const String middleName = 'middleName';
  static const String lastName = 'lastName';
}

class Student {
  final int? id;
  final String? studentId;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  Student({
    this.id,
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
  });

  static Student fromJson(Map<String, Object?> json) => Student(
      id: json[StudentFields.id] as int?,
      studentId: json[StudentFields.studentId] as String,
      firstName: json[StudentFields.firstName] as String,
      middleName: json[StudentFields.middleName] as String,
      lastName: json[StudentFields.lastName] as String);
  Map<String, Object?> toJson() => {
        StudentFields.id: id,
        StudentFields.studentId: studentId,
        StudentFields.firstName: firstName,
        StudentFields.middleName: middleName,
        StudentFields.lastName: lastName,
      };
  Student copy({
    int? id,
    String? studentId,
    String? firstName,
    String? middleName,
    String? lastName,
  }) =>
      Student(
          id: id ?? this.id,
          studentId: studentId ?? this.studentId,
          firstName: firstName ?? this.firstName,
          middleName: middleName ?? this.middleName,
          lastName: lastName ?? this.lastName);
}
