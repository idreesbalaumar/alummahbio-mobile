class StateOfRes {
  final int id;
  final String stateName;

//                 "id": 1,
//                 "state_name": "Abuja"

StateOfRes.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  stateName = jsonMap['state_name'] ?? '';
}
