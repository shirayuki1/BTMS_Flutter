import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  /// Base url for calling api
  static const String baseUrl =
      "https://bird-tournament-service.azurewebsites.net/";

  /// Timeout when calling API
  static const Duration timeout = Duration(seconds: 20);

  /// Default query of paging parameters
  static const Map<String, dynamic> defaultPagingQuery = {
    'page': '1',
    'pageSize': '20'
  };

  static const Map<String, String> requestHeaders = {
    // 'Content-type': 'application/json',
    // 'Accept': 'application/json',
    // 'Authorization': 'Bearer'
    'Authorization': 'token'
  };

  /// Get default rx var getx controller
  static Rx<T> get<T>() {
    return (Get.arguments['defaultState'] as T).obs;
  }

  /// Default image
  static const String imageErr = "assets/images/error.png";

  /// Default
  ///
  ///  image
  // static const String imageErr = "assets/images/error.png";

  // static const String pin = "assets/images/pin.png";

  // static const String discountTypeFixed = "Fixed";
  // static const String discountTypePercentage = "Percentage";
}

class Fonts {
  static const String montserrat = "Montserrat";
}

class AppBoxShadow {
  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 7,
    offset: const Offset(0, 2), // changes position of shadow
  );
  static BoxShadow boxShadowLight = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 0.5), // changes position of shadow
  );
}

class AppColors {
  static const Color primary = Color(0xffFF6F66);
  static const Color secondary = Color(0xffA48EAA);
  static const Color colorBlue = Color(0xff64B0E7);
  static const List<Color> gradientColor = [
    Color(0xff64B0E7),
    Color(0xff64B0E7)
  ];
  // static const List<Color> gradientColor =  [Color(0xff775FEA), Color(0xff324CDA)];
}

// class StorageConstants {
//   static const floorPlanBox = "floorPlanBox";
//   static const edgeBox = "edgeBox";
//   static const requestUriBox = "requestUriBox";
//   static const lastModified = "last-modified";
//   static final Duration expireDuration = Duration(days: 3);
//   static const dataNotModified = "Data is not modified";
// }

// class ConstImg {
//   static const String stairCase = "assets/images/staircase.png";
//   static const String elevator = "assets/images/elevator.png";
//   static const String restRoom = "assets/images/toilet.png";
//   static const String couponSaved = "assets/images/saved.svg";
//   static const String couponExpired = "assets/images/expired.svg";
// }

// class AppHiveType {
//   static const int location = 0;
//   static const int locationType = 1;
//   static const int floorPlan = 2;
//   static const int edge = 3;
//   static const int store = 4;
//   static const int storageListEdge = 5;
//   static const int lastModifiedHeader = 6;
// }
