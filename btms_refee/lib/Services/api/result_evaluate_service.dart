import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/result_evaluate.dart';

import 'base_service.dart';

mixin IResultEvaluateService {
  Future<List<ResultEvaluate>?> getResultById(int id);
}

class ResultEvaluateService extends BaseService<ResultEvaluate>
    with IResultEvaluateService {
  @override
  String endpoint() {
    return Endpoints.resultEvaluate;
  }

  // String endpoint2() {
  //   return Endpoints.bird;
  // }

  @override
  ResultEvaluate fromJson(Map<String, dynamic> json) {
    return ResultEvaluate.fromJson(json);
  }

  @override
  Future<List<ResultEvaluate>?> getResultById(int id) {
    return getAllByIdBase(Endpoints.resultEvaluate, id, {});
  }
}
