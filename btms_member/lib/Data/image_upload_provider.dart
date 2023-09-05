// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/connect.dart';

// // class ImageUploadProvider extends GetConnect {
// //   Future<String> uploadImages(List<String> list) async {
// //     try {
// //       final form = FormData({});
// //       for (String path in list) {
// //         form.fields.add(MapEntry(
// //             "file[]",
// //             MultipathFile(File(path),
// //                 filename:
// //                     "${DataTime.now().millisecondsSinceEpoch}.${path.split('.').last}")));
// //       }
// //       final response = await post();
// //       if(response.status.hasError){
        
// //       }
// //     } catch (exception) {
// //       return Future.error(exception.toString());
// //     }
// //   }
// // }

//    Future<dynamic> fileUpload(List<String> filepath, String url) async {
//     var token = await storage.getToken();
//     var idToken = await storage.getIdToken();
//     Dio dio = Dio();

//     List uploadList = [];
//     for (var file in filepath) {
//       var multipartFile = await MultipartFile.fromFile(
//         file
//       );
//       uploadList.add(multipartFile);
//     }

//     FormData formData = FormData.fromMap({"assignment": uploadList});
//      var response = await dio.post(APIURL.baseUrl + url,
//         data: formData,
//         options: Options(headers: {
//           HttpHeaders.authorizationHeader: "Bearer $token",
//           'idToken': idToken,
//         }));
//     return response;
//   }