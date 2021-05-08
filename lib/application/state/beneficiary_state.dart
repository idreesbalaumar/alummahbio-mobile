import 'package:alummahbio/application/classes/beneficiary/beneficiaries.dart';
import 'package:alummahbio/application/classes/beneficiary/beneficiary.dart';
import 'package:alummahbio/application/classes/common/pagination.dart';
import 'package:alummahbio/application/repositories/beneficiary_repository.dart';

class BeneficiaryState {
  final BeneficiaryRepository _beneficiaryRepository;

  BeneficiaryState(this._beneficiaryRepository);

  List<Beneficiary> _beneficiaries = [];
  List<Beneficiary> get beneficiaries => _beneficiaries;

  Pagination _pagination;
  bool _loading = false;
  bool get loading => _loading;

  Future getAllBeneciaries() async {
    int currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination.currentPage < _pagination.lastPage) {
      currentPage = _pagination.currentPage + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }

    if (fetchNext) {
      _loading = true;
      Beneficiaries _newBeneficiaries =
          await _beneficiaryRepository.getAllBeneficiaries(currentPage);
      _beneficiaries.addAll(_newBeneficiaries.beneficiaries);
      _pagination = _newBeneficiaries.pagination;
      _loading = false;
    }
  }
}
