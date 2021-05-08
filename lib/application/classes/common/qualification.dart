class Qualification {
  final int id;
  final String qualification;

Qualification.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  qualification = jsonMap['qualification'] ?? '';
}
