class BeneFiciaryCreatedBy {
  final int id;
  final String userName;
  final String emailVerifiedAt;
  final String phonePumber;
  final String profilePicture;
  final String isApproved;
  final String createdAt;
  final String updatedAt;

  BeneFiciaryCreatedBy.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  userName = jsonMap['user_name'] ?? '',
  emailVerifiedAt = jsonMap['email_verified_at'] ?? '',
  phonePumber = jsonMap['phone_number'] ?? '',
  profilePicture = jsonMap['profile_picture'] ?? '',
  isApproved = jsonMap['is_approved'] ?? '',
  createdAt = jsonMap['created_at'] ?? '',
  updatedAt = jsonMap['updated_at'] ?? '';
}

//                 "id": 1,
//                 "user_name": "Idris Bala Umar",
//                 "email_verified_at": "2021-04-24T16:19:31.000000Z",
//                 "phone_number": "+2348066679100",
//                 "email": "idreesbalaumar@gmail.com",
//                 "profile_picture": "https://scontent.fabv3-1.fna.fbcdn.net/v/t1.6435-9/97101412_240629830524399_2023214923978375168_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHp3_HhtfcpzyohZjIRNKtJXlrI85-mc4ReWsjzn6ZzhBqJjbVcl3PtozBpH3QKYbTkTouweRkbFLgQhCvdSulX&_nc_ohc=TKzFmBckJJwAX-rPtUA&_nc_ht=scontent.fabv3-1.fna&oh=73763d1dd6d3434934823f5681c20537&oe=609E1A60",
//                 "is_approved": 1,
//                 "created_at": "2021-04-24T16:19:31.000000Z",
//                 "updated_at": null