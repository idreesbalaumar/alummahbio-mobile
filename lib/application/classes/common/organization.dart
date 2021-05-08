class Organization {
  final int id;
  // final String qualification;
  final String organizationName;
  final String address;
  final String webUrl;
  final String logo;
  final String description;
  final String descOfBeneficiaries;
  final String comments;
  final int userId;
  final int isAdfAgent;
  final String createdAt;
  final String updatedAt;

Organization.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  // qualification = jsonMap['qualification'] ?? '',
  organizationName = jsonMap['organization_name'] ?? '',
  address = jsonMap['address'] ?? '',
  webUrl = jsonMap['web_url'] ?? '',
  logo = jsonMap['logo'] ?? '',
  description = jsonMap['description'] ?? '',
  descOfBeneficiaries = jsonMap['desc_of_beneficiaries'] ?? '',
  comments = jsonMap['comments'] ?? '',
  userId = jsonMap['user_id'] ?? '',
  isAdfAgent = jsonMap['is_adf_agent'] ?? '',
  createdAt = jsonMap['created_at'] ?? '',
  updatedAt = jsonMap['updated_at'] ?? '';
}