import 'package:get/get.dart';

import '../controllers/bloc_controller.dart';

class BlocBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlocController>(
      () => BlocController(),
    );
  }
}
