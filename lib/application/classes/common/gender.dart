
class Gender {
  final int id;
  final String genderName;

  Gender.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  genderName = jsonMap['genderName'] ?? '';
}