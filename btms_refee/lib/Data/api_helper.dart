import 'package:btms_refee/Common/constants.dart';
import 'package:get/get.dart';

mixin IApiHelper {
  // Get all from an API [endpoint] using [uri] and [query]
  Future<Response> getAll<T>(
    String uri, {
    Map<String, dynamic> query = Constants.defaultPagingQuery,
    Map<String, String> request = Constants.requestHeaders,
  });

  /// Get 1 by Id from API [endpoint] using [uri] and [id]
  Future<Response> getById<T>(String endpoint, dynamic id,
      {Map<String, String> request = Constants.requestHeaders});

  /// Post 1 to API [endpoint] providing [data]
  Future<Response> postOne(String endpoint, Map<String, dynamic> data,
      {Map<String, String> request = Constants.requestHeaders});

  /// Post 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> postOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  );

  /// Post 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> postOneWithFile(
    String endpoint,
    Map<String, dynamic> data,
    MultipartFile file,
  );

  /// Put 1 to API [endpoint] providing [id] and [data]
  Future<Response> putOne(
      String endpoint, dynamic id, Map<String, dynamic> data,
      {Map<String, String> request = Constants.requestHeaders});

  /// Put 1 to API [endpoint] providing [id] and [data]
  Future<Response> putOne2(String endpoint, Map<String, dynamic>? data,
      {Map<String, String> request = Constants.requestHeaders});

  /// Put 1 to API [endpoint] providing [data] with one file [files]
  Future<Response> putOneWithOneFile(String endpoint, Map<String, dynamic> data,
      MultipartFile file, String fileName);

  /// Put 1 to API [endpoint] providing [data] with many files [files]
  Future<Response> putOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  );

  /// Delete from API [endpoint] with [id]
  Future<Response> deleteOne(String endpoint, dynamic id,
      {Map<String, String> request = Constants.requestHeaders});

  /// Convert json array to list
  List<T> convertToList<T>(dynamic body, Function fromJson);
}

/// Class for calling HTTP methods
class ApiHelper extends GetConnect with IApiHelper {
  /// Auth services
  // final IAuthService _authService = Get.find();
  @override
  void onInit() {
    super.onInit();

    // Set baseUrl & timeout for API call
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = Constants.timeout;

    // Request modifier: [Add bearer token]
    // httpClient.addRequestModifier((Request request) async {
    //   request.headers["Authorization"] = await AuthServices.getAuthHeader();
    //   // print("Token: " + request.headers["Authorization"].toString());

    //   return request;
    // });

    // //Request modifier: [if-modified-since: header]
    // httpClient.addRequestModifier((Request request) async {
    //   if (request.url.path.contains("edges")) {
    //     final lastModified = await HiveStorage.getIfModifiedSinceHeader(
    //       HiveStorage.getEndpoint(request.url),
    //     );
    //     if (lastModified != null) {
    //       request.headers["if-modified-since"] = lastModified;
    //     }
    //   }
    //   return request;
    // });

    //Response modifier: [last-modified: header]
    //   httpClient.addResponseModifier((request, response) async {
    //     String? lastModified = response.headers?["last-modified"];
    //     HiveStorage.saveLastModifiedHeader(
    //       lastModified,
    //       HiveStorage.getEndpoint(request.url),
    //     );
    //     return response;
    //   });
    // }
  }

  @override
  Future<Response> getAll<T>(
    String uri, {
    Map<String, dynamic>? query = Constants.defaultPagingQuery,
    Map<String, String> request = Constants.requestHeaders,
  }) {
    return get<T>(uri, query: query, headers: request);
  }

  @override
  Future<Response> getById<T>(String endpoint, dynamic id,
      {Map<String, String>? request = Constants.requestHeaders}) {
    return get<T>('$endpoint$id', headers: request);
  }

  @override
  Future<Response> postOne(String endpoint, Map<String, dynamic> data,
      {Map<String, String>? request = Constants.requestHeaders}) {
    return post(endpoint, headers: request, data);
  }

  @override
  Future<Response> postOneWithFile(
    String endpoint,
    Map<String, dynamic> data,
    MultipartFile file,
  ) {
    var form = FormData(data);
    form.files.add(MapEntry('file', file));
    return post(endpoint, form);
  }

  @override
  Future<Response> postOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  ) {
    var form = FormData(data);
    for (var file in files) {
      form.files.add(MapEntry('files', file));
    }
    return post(endpoint, form);
  }

  @override
  Future<Response> putOne(
      String endpoint, dynamic id, Map<String, dynamic> data,
      {Map<String, String> request = Constants.requestHeaders}) {
    print("123" + "$endpoint$id");
    return put('$endpoint$id', headers: request, data);
  }

  @override
  Future<Response> putOne2(String endpoint, Map<String, dynamic>? data,
      {Map<String, String> request = Constants.requestHeaders}) {
    print("123" + "$endpoint");
    return put('$endpoint', headers: request, data);
  }

  @override
  Future<Response> putOneWithOneFile(String endpoint, Map<String, dynamic> data,
      MultipartFile file, String fileName) {
    var form = FormData(data);
    form.files.add(MapEntry(fileName, file));

    return put(endpoint, form);
  }

  @override
  Future<Response> putOneWithFiles(
    String endpoint,
    Map<String, dynamic> data,
    List<MultipartFile> files,
  ) {
    var form = FormData(data);
    for (var file in files) {
      form.files.add(MapEntry('files', file));
    }
    return put(endpoint, form);
  }

  @override
  Future<Response> deleteOne(String endpoint, dynamic id,
      {Map<String, String>? request = Constants.requestHeaders}) {
    print("123" + "$endpoint$id");
    return delete('$endpoint$id', headers: request);
  }

  @override
  List<T> convertToList<T>(body, Function fromJson) {
    return (body as List).map<T>((x) => fromJson(x)).toList();
  }
}
