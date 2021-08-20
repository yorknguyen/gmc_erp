import 'package:gmc_erp/common/service/BaseServiceImpl.dart';
import 'package:gmc_erp/models/ProductOrderCount.dart';
import 'package:gmc_erp/models/ProductOrderOpen.dart';
import 'package:gmc_erp/repository/ProductOrderRepsitory.dart';
import 'package:gmc_erp/services/ProductOrderService.dart';
import 'package:gmc_erp/common/constants/Constants.dart';

class ProductOrderServiceImpl extends BaseServiceImpl<ProductOrderServiceImpl, int> implements ProductOrderService {

  final repository = ProductOrderRepsitory();

  @override
  Future<ProductOrderCount> getCount(String type) {
      return repository.getCount(type);
  }

  @override
  Future<List<ProductOrderOpen>> getListPoOrder(String type, String statusType) {
    String status = Constants.getQueryProductOrder(statusType);

    return repository.getListPoOrder(type, status);
  }
}