import 'package:btms_member/Pages/Cart/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<CartController>(() => CartController());
  }
}
