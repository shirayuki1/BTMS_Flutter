import 'package:btms_refee/Common/exception_handling/endpoints.dart';
import 'package:btms_refee/Models/images.dart';
import 'base_service.dart';

mixin IImagesService {
  Future<List<Images>?> getAllImages();
  Future<Images?> getById(int id);
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
  Future<List<Images>?> getAllImages() {
    return getAllBase2({}, {});
  }

  @override
  Future<Images?> getById(int id) {
    return getByIdBase2(Endpoints.BirdDetail, id, {});
  }
}
