// import 'package:btms/Common/exception_handling/endpoints.dart';
// import 'package:btms/Models/images.dart';
import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/images.dart';
import 'package:btms_member/Models/videos.dart';
import 'base_service.dart';

mixin IVideosService {
  Future<List<Videos>?> getAllById(int id);
}

class VideosService extends BaseService<Videos> with IVideosService {
  @override
  String endpoint() {
    return Endpoints.VideoBird;
  }

  @override
  Videos fromJson(Map<String, dynamic> json) {
    return Videos.fromJson(json);
  }

  @override
  Future<List<Videos>?> getAllById(int id) {
    return getAllBase3(Endpoints.VideoBird, id, {});
  }
}
