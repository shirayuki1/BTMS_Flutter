import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/user.dart';
import 'base_service.dart';

mixin IUserService {
  // Future<User?> loginWithFirebase(String idToken);
  Future<User?> loginWithUsername(Map<String, dynamic> body);
  Future<User?> registerUser(Map<String, dynamic> body);
  Future<bool> updateProfile(Map<String, dynamic> data);

  // Future<User?> getById(int id);
  // Future<bool> updateProfile(int id, Map<String, String> data, String filePath);
}

class UserService extends BaseService<User> with IUserService {
  @override
  String endpoint() {
    return Endpoints.accounts;
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  // @override
  // Future<User?> loginWithFirebase(String idToken) async {
  //   return postNoAuth(Endpoints.loginFirebase, {"idToken": idToken});
  // }

  @override
  Future<User?> loginWithUsername(Map<String, dynamic> body) {
    return postNoAuth(Endpoints.accounts, body);
  }

  @override
  Future<User?> registerUser(Map<String, dynamic> body) {
    return postNoAuth(Endpoints.registerAccount, body);
  }

  @override
  Future<bool> updateProfile(Map<String, dynamic> data) {
    return putBase3(Endpoints.updateProfile, {}, data);
  }
  // @override
  // Future<User?> getById(int id) {
  //   return getByIdBase(id);
  // }

  // @override
  // Future<bool> updateProfile(
  //     int id, Map<String, String> data, String filePath) {
  //   return putWithOneFileBase(data, filePath, id);
  //}
}
