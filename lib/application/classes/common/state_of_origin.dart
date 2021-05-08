class StateOfOrigin {
  final int id;
  final String stateName;
  
StateOfOrigin.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  stateName = jsonMap['state_name'] ?? '';
}
