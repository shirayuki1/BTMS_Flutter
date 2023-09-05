import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/score_type.dart';
import 'base_service.dart';

mixin IScoreTypeService {
  Future<List<ScoreType>?> getAllScoreType(int roundNumber);
  Future<bool> evaluate(Map<String, dynamic> data);
  Future<bool> evaluate2(Map<String, dynamic> data);
  // //choose page
  // Future<bool> createBird1(Map<String, dynamic> bird);
  // Future<List<Bird>?> getAllBird1();
}

class ScoreTypeService extends BaseService<ScoreType> with IScoreTypeService {
  @override
  String endpoint() {
    return Endpoints.listScoreType;
  }

  // String endpoint2() {
  //   return Endpoints.bird;
  // }

  @override
  ScoreType fromJson(Map<String, dynamic> json) {
    return ScoreType.fromJson(json);
  }

  @override
  Future<List<ScoreType>?> getAllScoreType(int roundNumber) {
    return getAllByIdBase(endpoint(), roundNumber, {});
  }

  @override
  Future<bool> evaluate(Map<String, dynamic> data) {
    return postBase(Endpoints.evaluateBird, data, {});
  }

  @override
  Future<bool> evaluate2(Map<String, dynamic> data) {
    return postBase(Endpoints.evaluateBirdLast, data, {});
  }
}
