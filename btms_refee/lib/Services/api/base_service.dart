import 'dart:convert';

import 'package:btms_refee/Data/api_helper.dart';
import 'package:btms_refee/Models/paging2.dart';
import 'package:btms_refee/Models/round.dart';
import 'package:btms_refee/Services/GlobalStates/share_states.dart';
import 'package:btms_refee/Services/api/paging.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:supercharged/supercharged.dart';

abstract class BaseService<T> {
  final IApiHelper _apiHelper = Get.find();

  /// Set decode function for entity
  T fromJson(Map<String, dynamic> json);

  /// Set api endpoint for entity
  String endpoint();

  Future<T?> postNoAuth(String endpoint, Map<String, dynamic> body) async {
    Response res = await _apiHelper.postOne(endpoint, body);
    print("hello${res.statusCode}");
    if (res.statusCode == HttpStatus.ok) {
      return fromJson(res.body);
    }
    //7/7/2023
    // return null;
  }

  Future<T?> getByIdBase2(
      String endpoint, id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response response = await _apiHelper
        .getById(endpoint, id, request: {'Authorization': 'bearer $token'});

    print("result ${response.statusCode}");
    print("body ======= ${response.body}");
    if (response.isOk) {
      return fromJson(response.body);
    }
    //7/7/2023
    // return null;
  }

  Future<List<T>?> getAllByIdBase(
      String endpoint, id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response response = await _apiHelper
        .getById(endpoint, id, request: {'Authorization': 'bearer $token'});

    print("result ${response.statusCode}");
    print("body ======= ${response.body}");
    if (response.isOk) {
      Paging2<T> paging = Paging2.fromJson(response.body);
      List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();
      print("hello $content");
      return content ?? [];
    }
  }

  /// Get paging instance from API with [query]
  Future<Paging<T>> getPagingBase(Map<String, dynamic> query) async {
    Response res = await _apiHelper.getAll(endpoint(), query: query);
    Paging<T> paging = Paging.fromJson(res.body);
    paging.convertToList(fromJson);
    return paging;
  }

  /// Get list instances from API with [query]
  Future<List<T>?> getAllBase(
      Map<String, dynamic> query, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper.getAll(endpoint(),
        query: query, request: {'Authorization': 'bearer $token'});
    print("123${res.statusCode}");
    print("l " + res.body);
    Paging<T> paging = Paging.fromJson(res.body);
    paging.convertToList(fromJson);
    return paging.data ?? [];
  }

  /// Get list instances from API with [query]
  Future<List<T>?> getAllBase2(
      Map<String, dynamic> query, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper.getAll(endpoint(),
        query: query, request: {'Authorization': 'bearer $token'});
    print("author: $token");
    print(
        "HTTP STATUS CODE: ${res.statusCode}========================================");
    if (res.isOk) {
      Paging2<T> paging = Paging2.fromJson(res.body);
      List<T>? content = paging.rawContent?.map<T>((x) => fromJson(x)).toList();
      print("hello $content");
      return content ?? [];
    } else if (res.statusCode.toString() == "403") {
      List<T>? content;
      return content ?? [];
    }
    //7/7/2023
    // return null;
  }

  /// Post an instance with [body]
  Future<bool> postBase(String endpoint, Map<String, dynamic> body,
      Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper
        .postOne(endpoint, body, request: {'Authorization': 'bearer $token'});
    print("HTTP STATUS CODE: " +
        res.statusCode.toString() +
        "========================================");
    if (res.statusCode == HttpStatus.created) {
      return true;
    }
    if (res.statusCode == HttpStatus.ok) {
      return true;
    }

    if (res.statusCode.toString() == "403") {
      return false;
    }
    //7/7/2023
    return false;
  }

  /// Post an instance with [body]
  // Future<T?> postWithFilesBase(
  //   Map<String, dynamic> body,
  //   List<String> filePaths,
  // ) async {
  //   List<MultipartFile> files = filePaths
  //       .map((path) => FileUploadUtils.convertToMultipart(path))
  //       .toList();
  //   final callback = () => _apiHelper.postOneWithFiles(endpoint(), body, files);
  //   Response res = await AuthServices.handleUnauthorized(callback);
  //   if (res.statusCode == HttpStatus.created) {
  //     return fromJson(res.body);
  //   }
  // }

  /// Post an instance with [body]
  // Future<T?> postWithOneFileBase(
  //   Map<String, dynamic> body,
  //   String filePath,
  // ) async {
  //   final callback = () => _apiHelper.postOneWithFile(
  //         endpoint(),
  //         body,
  //         FileUploadUtils.convertToMultipart(filePath),
  //       );
  //   Response res = await AuthServices.handleUnauthorized(callback);
  //   if (res.statusCode == HttpStatus.created) {
  //     return fromJson(res.body);
  //   }
  // }

  /// Put an instance with [id] and [body]
  Future<bool> putBase(String endpoint, id, Map<String, dynamic> body,
      Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper.putOne(endpoint, id, body,
        request: {'Authorization': 'bearer $token'});
    print(res.statusCode.toString());
    print("test" + body.toString());
    if (res.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  Future<bool> putBase3(String endpoint, Map<String, String> request,
      Map<String, dynamic> body) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper
        .putOne2(endpoint, body, request: {'Authorization': 'bearer $token'});
    print(res.statusCode.toString());
    // print("test" + body.toString());
    if (res.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  /// Put an instance with [body] and a file path [filePath]
  // Future<bool> putWithOneFileBase(
  //     Map<String, dynamic> body, String filePath, int id,
  //     [String fileName = "imageUrl"]) async {
  //   final callback = () => _apiHelper.putOneWithOneFile(
  //         endpoint() + "/" + id.toString(),
  //         body,
  //         FileUploadUtils.convertToMultipart(filePath),
  //         fileName,
  //       );
  //   Response res = await AuthServices.handleUnauthorized(callback);
  //   if (res.statusCode == HttpStatus.noContent) {
  //     return true;
  //   }
  //   return false;
  // }

  /// Put an instance with [body]
  // Future<bool> putWithFilesBase(
  //   Map<String, dynamic> body,
  //   List<String> filePaths,
  // ) async {
  //   List<MultipartFile> files = filePaths
  //       .map((path) => FileUploadUtils.convertToMultipart(path))
  //       .toList();
  //   final callback = () => _apiHelper.putOneWithFiles(endpoint(), body, files);
  //   Response res = await AuthServices.handleUnauthorized(callback);
  //   if (res.statusCode == HttpStatus.noContent) {
  //     return true;
  //   }
  //   return false;
  // }

  // Delete an instance
  Future<bool> deleteBase(
      String endpoint, id, Map<String, String> request) async {
    SharedStates sharedStates = Get.find();
    String token = sharedStates.token;
    Response res = await _apiHelper
        .deleteOne(endpoint, id, request: {'Authorization': 'bearer $token'});
    print("result" + res.statusCode.toString());
    if (res.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
    // return res.statusCode == HttpStatus.noContent;
  }
}
