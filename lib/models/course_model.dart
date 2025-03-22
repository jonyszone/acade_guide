  class Course {
  final String id;
  final String universityName;
  final String courseName;
  final String description;
  final String duration;

  Course({
    required this.id,
    required this.universityName,
    required this.courseName,
    required this.description,
    required this.duration,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      universityName: json['universityName'],
      courseName: json['courseName'],
      description: json['description'],
      duration: json['duration'],
    );
  }
}