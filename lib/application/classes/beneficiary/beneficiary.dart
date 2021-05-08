import 'package:alummahbio/application/classes/auth/user.dart';
import 'package:alummahbio/application/classes/common/gender.dart';
import 'package:alummahbio/application/classes/common/lga.dart';
import 'package:alummahbio/application/classes/common/organization.dart';
import 'package:alummahbio/application/classes/common/qualification.dart';
import 'package:alummahbio/application/classes/common/state_of_origin.dart';
import 'package:alummahbio/application/classes/common/state_of_res.dart';

class Beneficiary {
  final int id;
  final String firstName;
  final Gender gender;
  final String dob;
  final String phoneNumber;
  final String alternativePhoneNumber;
  final String email;
  final String contactAddress;
  final StateOfRes stateOfResidence;
  final String community;
  final StateOfOrigin stateOfOrigin;
  final LGA lga;
  final Qualification qualification;
  final String jobExperience;
  final String trainingOrResoucesRequiredToAdvance;
  final String guarantorName;
  final String guarantoAddress;
  final String guarantorPhone;
  final String benefciaryPhoto;
  final String agentComments;
  final Organization organization;
  final User createdBy;
  final String  createdAt;

   Beneficiary.fromJson(Map<String, dynamic> jsonMap)
  : id = jsonMap['id'] ?? 0,
  firstName = jsonMap['firstName'] ?? '',
  gender = jsonMap['gender'] !=null
  ? Gender.fromJson(jsonMap['gender'])
  : null,
  dob = jsonMap['dob'] ?? '',
  phoneNumber = jsonMap['phoneNumber'] ?? '',
  alternativePhoneNumber = jsonMap['alternativePhoneNumber'] ?? '',
  email = jsonMap['email'] ?? '',
  contactAddress = jsonMap['contactAddress'] ?? '',
 stateOfResidence = jsonMap['stateOfResidence'] !=null
  ? StateOfRes.fromJson(jsonMap['stateOfResidence'])
  : null,
  community = jsonMap['community'] ?? '',
  stateOfOrigin = jsonMap['stateOfOrigin'] !=null
  ? StateOfOrigin.fromJson(jsonMap['stateOfOrigin'])
  : null,
  lga = jsonMap['lga'] !=null
  ? LGA.fromJson(jsonMap['lga'])
  : null,
  qualification = jsonMap['qualification'] !=null
  ? Qualification.fromJson(jsonMap['qualification'])
  : null,
  jobExperience = jsonMap['jobExperience'] ?? '',
  trainingOrResoucesRequiredToAdvance = jsonMap['trainingOrResoucesRequiredToAdvance'] ?? '',
  guarantorName = jsonMap['guarantorName'] ?? '',
  guarantoAddress = jsonMap['guarantoAddress'] ?? '',
  guarantorPhone = jsonMap['guarantorPhone'] ?? '',
  benefciaryPhoto = jsonMap['benefciaryPhoto'] ?? '',
  agentComments = jsonMap['agentComments'] ?? '',
  organization = jsonMap['organization'] !=null
  ? Organization.fromJson(jsonMap['organization'])
  : null,
  createdBy = jsonMap['createdBy'] !=null
  ? User.fromJson(jsonMap['createdBy'])
  : null,
  createdAt = jsonMap['createdAt'] ?? '';


  

//   {
//     {
//             "id": 1,
//             "firstName": "Idris",
//             "middleName": "Bala",
//             "surname": "Umar",
//             "gender": {
//                 "id": 1,
//                 "genderName": "Male"
//             },
//             "dob": "Sat, May 9, 1987 12:00 AM",
//             "phoneNumber": "+2348066679100",
//             "alternativePhoneNumber": "+2348087966663",
//             "email": "idreesbalaumar@gmail.com",
//             "contactAddress": "No 16 Muhammadu Buhari Way, 3rd Floor BOI Building, Kaduna State – Nigeria",
//             "stateOfResidence": {
//                 "id": 1,
//                 "state_name": "Abuja"
//             },
//             "community": "Gwarinpa",
//             "stateOfOrigin": {
//                 "id": 6,
//                 "state_name": "Bauchi"
//             },
//             "lga": {
//                 "id": 4,
//                 "lgaName": "Abuja Municipal"
//             },
//             "qualification": {
//                 "id": 7,
//                 "qualification": "Others"
//             },
//             "jobExperience": "Certified Software Engineer from National Institute for Information Technology (NIIT), Software Developer and Designer with expert knowledge of Information and Communication Technology. Information and Communication Technology with established career working as a Developer at Century Information Systems Suite C034 H&A Plaza, Plot 697 Idris Gidado St, Wuye, Abuja.",
//             "trainingOrResoucesRequiredToAdvance": "Digital Marketing and Top up (One year programme in an international university to convert my diploma to degree)",
//             "guarantorName": "Hajia Zeenatu Umar, MD/CEO Al-Ummah Development Foundation.",
//             "guarantoAddress": "No 16 Muhammadu Buhari Way, 3rd Floor BOI Building, Kaduna State – Nigeria",
//             "guarantorPhone": "",
//             "benefciaryPhoto": "https://scontent.fabv3-1.fna.fbcdn.net/v/t1.6435-9/97101412_240629830524399_2023214923978375168_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHp3_HhtfcpzyohZjIRNKtJXlrI85-mc4ReWsjzn6ZzhBqJjbVcl3PtozBpH3QKYbTkTouweRkbFLgQhCvdSulX&_nc_ohc=TKzFmBckJJwAX-rPtUA&_nc_ht=scontent.fabv3-1.fna&oh=73763d1dd6d3434934823f5681c20537&oe=609E1A60",
//             "agentComments": "First Record of ADF Beneficiary database",
//             "organization": {
//                 "id": 1,
//                 "organization_name": "Al-Ummah Development Foundation (ADF)",
//                 "address": "No 16 Muhammadu Buhari Way, 3rd Floor BOI Building, Kaduna State – Nigeria",
//                 "web_url": "www.alummahdevelopmentfoundation.com",
//                 "logo": "https://alummahdevelopmentfoundation.com/wp-content/uploads/2020/12/adflogo.png",
//                 "description": "Al-Ummah Development Foundation [ADF] is a charitable organization duly registered with the Federal Republic of Nigeria on 7th July 2009. It was founded for the sole purpose of societal reform, the programs of ADF are tailored to address socio-economic difficulties and to activate a peaceful process of socio-economic change by establishing vital structures to accomplish wide ranging educational, economic and social improvements within Northern Nigeria and beyond...",
//                 "desc_of_beneficiaries": "Al-majirai (young children to become well-educated in Islamic matters, aimless youths, women with various challenges, women with various challenges...etc)",
//                 "comments": "The transformation packages of ADF are developed to serve three critical areas of requirement and to be implemented in three separate programs, each designed to transform that area of critical socio-economic need",
//                 "user_id": 1,
//                 "is_adf_agent": 1,
//                 "created_at": "2021-04-24T16:19:32.000000Z",
//                 "updated_at": null
//             },
//             "createdBy": {
//                 "id": 1,
//                 "user_name": "Idris Bala Umar",
//                 "email_verified_at": "2021-04-24T16:19:31.000000Z",
//                 "phone_number": "+2348066679100",
//                 "email": "idreesbalaumar@gmail.com",
//                 "profile_picture": "https://scontent.fabv3-1.fna.fbcdn.net/v/t1.6435-9/97101412_240629830524399_2023214923978375168_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHp3_HhtfcpzyohZjIRNKtJXlrI85-mc4ReWsjzn6ZzhBqJjbVcl3PtozBpH3QKYbTkTouweRkbFLgQhCvdSulX&_nc_ohc=TKzFmBckJJwAX-rPtUA&_nc_ht=scontent.fabv3-1.fna&oh=73763d1dd6d3434934823f5681c20537&oe=609E1A60",
//                 "is_approved": 1,
//                 "created_at": "2021-04-24T16:19:31.000000Z",
//                 "updated_at": null
//             },
//             "createdAt": "2021-04-24 16:19:33"
//         }
// }
}