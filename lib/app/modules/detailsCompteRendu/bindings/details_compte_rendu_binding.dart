import 'package:get/get.dart';

import '../controllers/details_compte_rendu_controller.dart';

class DetailsCompteRenduBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsCompteRenduController>(
      () => DetailsCompteRenduController(),
    );
  }
}
