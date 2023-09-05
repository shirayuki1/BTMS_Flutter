import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/score_criteria.dart';
import 'base_service.dart';

mixin IScoreCriteriaService {
  Future<List<ScoreCriteria>?> getAllScoreCriteria();

  // //choose page
  // Future<bool> createBird1(Map<String, dynamic> bird);
  // Future<List<Bird>?> getAllBird1();
}

class ScoreCriteriaService extends BaseService<ScoreCriteria>
    with IScoreCriteriaService {
  @override
  String endpoint() {
    return Endpoints.listScoreCriteria;
  }

  // String endpoint2() {
  //   return Endpoints.bird;
  // }

  @override
  ScoreCriteria fromJson(Map<String, dynamic> json) {
    return ScoreCriteria.fromJson(json);
  }

  @override
  Future<List<ScoreCriteria>?> getAllScoreCriteria() {
    return getAllBase2({}, {});
  }
}
