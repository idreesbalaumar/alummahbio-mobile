import 'package:alummahbio/application/alummahbio_api.dart';
import 'package:alummahbio/application/classes/beneficiary/beneficiaries.dart';
import 'package:alummahbio/application/classes/beneficiary/beneficiary.dart';
import 'package:alummahbio/application/classes/common/pagination.dart';
import 'package:alummahbio/application/classes/errors/common_error.dart';
import 'package:alummahbio/application/storage/localstorage.dart';
import 'package:alummahbio/application/storage/storage_keys.dart';
import 'package:dio/dio.dart';

abstract class BeneficiaryRepository {
  Future<Beneficiaries> getAllBeneficiaries(int page);
}

class BeneficiaryRepositoryImpl implements BeneficiaryRepository {
  @override
  Future<Beneficiaries> getAllBeneficiaries(int page) async {
    try {
      final response = await AlummahbioApi.dio.get("/api/beneficiary?page=$page",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      // print(response);
      List _temp = response.data['data'];
      var _meta = response.data['meta'];

      Pagination pagination = Pagination.fromJson(_meta);

      List<Beneficiary> _beneficiaries = _temp
          .map((beneficiary) => Beneficiary.fromJson(beneficiary))
          .toList();
      return new Beneficiaries(pagination: pagination, beneficiaries: _beneficiaries);
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
