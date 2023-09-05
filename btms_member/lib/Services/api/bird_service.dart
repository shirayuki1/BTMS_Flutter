// import 'package:btms/Common/exception_handling/endpoints.dart';
// import 'package:btms/Models/bird.dart';
import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/bird.dart';
import 'base_service.dart';

mixin IBirdService {
  Future<List<Bird>?> getAllBird();
  Future<Bird?> getById(int id);
  Future<bool> update(int id, Map<String, dynamic> data);
  Future<bool> delete(int id, Map<String, dynamic>? data);
  // Future<bool> delete(int id);
  Future<bool> createBird(Map<String, dynamic> bird);
  Future<bool> createImages(Map<String, dynamic> images);
  // Future<Bird?> getById1(int id);
  Future<List<Bird>?> getAllBird1(int id);

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
  String endpoint3() {
    return Endpoints.chooseList;
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

  // @override
  // Future<bool> delete(int id) {
  //   return deleteBase(Endpoints.bird, id, {});
  // }

  @override
  Future<bool> delete(int id, Map<String, dynamic>? data) {
    return putBase2(Endpoints.birdDelete, id, {}, data);
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
  Future<bool> createImages(Map<String, dynamic> images) {
    return postBase(Endpoints.imageCreate, images, {});
  }

  @override
  Future<bool> createBird1(Map<String, dynamic> bird) {
    return postBase(Endpoints.birdCreate, bird, {});
  }

  @override
  Future<List<Bird>?> getAllBird1(int id) {
    return getAllByIdBase(Endpoints.chooseList, id, {});
  }

  // @override
  // Future<Bird?> getById1(int id) {
  //   return getByIdBase2(Endpoints.chooseList, id, {});
  // }
}
