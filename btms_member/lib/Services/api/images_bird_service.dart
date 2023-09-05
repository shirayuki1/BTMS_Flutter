// import 'package:btms/Common/exception_handling/endpoints.dart';
// import 'package:btms/Models/images.dart';
import 'package:btms_member/Common/exception_handling/endpoints.dart';
import 'package:btms_member/Models/images.dart';
import 'base_service.dart';

mixin IImagesService {
  Future<List<Images>?> getAllById(int id);
}

class ImagesService extends BaseService<Images> with IImagesService {
  @override
  String endpoint() {
    return Endpoints.ImageBird;
  }

  @override
  Images fromJson(Map<String, dynamic> json) {
    return Images.fromJson(json);
  }

  @override
  Future<List<Images>?> getAllById(int id) {
    return getAllBase3(Endpoints.ImageBird, id, {});
  }
}
