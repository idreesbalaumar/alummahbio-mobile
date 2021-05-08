class LGA {
  final int id;
  final String lgaName;

LGA.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  lgaName = jsonMap['lgaName'] ?? '';
}
