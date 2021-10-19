// ignore_for_file: non_constant_identifier_names
import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  final String? studentId;
  @HiveField(1)
  final String? firstName;
  @HiveField(2)
  final String? middleName;
  @HiveField(3)
  final String? lastName;
  Student({
    this.studentId,
    this.firstName,
    this.middleName,
    this.lastName,
  });
}
