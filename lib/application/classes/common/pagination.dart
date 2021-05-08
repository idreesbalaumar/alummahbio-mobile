
class Pagination {
  final int currentPage;
  final int lastPage;
  final int tolalRecords;

  Pagination.fromJson(Map<String, dynamic> jsonMap)
      : currentPage = jsonMap['current_page'] ?? 0,
        lastPage = jsonMap['last_page'] ?? 0,
        tolalRecords = jsonMap['total'] ?? 0;
}
