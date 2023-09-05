import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/bird_achievement.dart';

import 'base_service.dart';

mixin IBirdAchievementService {
  Future<List<Bird_Achievement>?> getById(int id);

  // //choose page
  // Future<bool> createBird1(Map<String, dynamic> bird);
  // Future<List<Bird>?> getAllBird1();
}

class BirdAchievementService extends BaseService<Bird_Achievement>
    with IBirdAchievementService {
  @override
  String endpoint() {
    return Endpoints.historyRanking;
  }

  @override
  Bird_Achievement fromJson(Map<String, dynamic> json) {
    return Bird_Achievement.fromJson(json);
  }

  @override
  Future<List<Bird_Achievement>?> getById(int id) {
    return getAllByIdBase(Endpoints.historyRanking, id, {});
  }
}
