import 'package:alummahbio/application/classes/beneficiary/beneficiary.dart';
import 'package:alummahbio/application/classes/common/pagination.dart';
import 'package:flutter/foundation.dart';

class Beneficiaries {
  final Pagination pagination;
  final List<Beneficiary> beneficiaries;

  Beneficiaries({
    @required this.pagination,
    @required this.beneficiaries,
  });
}
