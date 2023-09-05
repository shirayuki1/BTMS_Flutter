import 'package:btms_member/Pages/CreateBird_Tournament/controller/create_bird_1_controller.dart';
import 'package:get/get.dart';

class CreateBird1Binding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<CreateBird1Controller>(() => CreateBird1Controller());
  }
}
