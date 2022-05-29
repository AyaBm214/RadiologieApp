import 'package:get/get.dart';

import '../controllers/dicter_controller.dart';

class DicterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DicterController>(
      () => DicterController(),
    );
  }
}
