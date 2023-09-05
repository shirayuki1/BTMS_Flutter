import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/bird.dart';
import 'base_service.dart';

mixin IBirdService {
  Future<List<Bird>?> getAllBird();
  Future<Bird?> getById(int id);
  Future<bool> update(int id, Map<String, dynamic> data);
  Future<bool> delete(int id);
  Future<bool> createBird(Map<String, dynamic> bird);

  // //choose page
  // Future<bool> createBird1(Map<String, dynamic> bird);
  // Future<List<Bird>?> getAllBird1();
}

class BirdService extends BaseService<Bird> with IBirdService {
  @override
  String endpoint() {
    return Endpoints.BirdList;
  }

  String endpoint2() {
    return Endpoints.bird;
  }

  @override
  Bird fromJson(Map<String, dynamic> json) {
    return Bird.fromJson(json);
  }

  @override
  Future<List<Bird>?> getAllBird() {
    return getAllBase2({}, {});
  }

  @override
  Future<Bird?> getById(int id) {
    return getByIdBase2(Endpoints.BirdDetail, id, {});
  }

  @override
  Future<bool> delete(int id) {
    return deleteBase(Endpoints.bird, id, {});
  }

  @override
  Future<bool> update(int id, Map<String, dynamic> data) {
    return putBase(Endpoints.bird, id, data, {});
  }

  @override
  Future<bool> createBird(Map<String, dynamic> bird) {
    return postBase(Endpoints.birdCreate, bird, {});
  }

  @override
  Future<bool> createBird1(Map<String, dynamic> bird) {
    return postBase(Endpoints.birdCreate, bird, {});
  }

  @override
  Future<List<Bird>?> getAllBird1() {
    return getAllBase2({}, {});
  }
}
