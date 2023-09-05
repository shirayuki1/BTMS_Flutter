import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/score_type.dart';
import 'base_service.dart';

mixin IScoreTypeService {
  Future<List<ScoreType>?> getAllScoreType();

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
  Future<List<ScoreType>?> getAllScoreType() {
    return getAllBase2({}, {});
  }
}
