import 'package:get/get.dart';

import '../controllers/list_comptes_rendus_controller.dart';

class ListComptesRendusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListComptesRendusController>(
      () => ListComptesRendusController(),
    );
  }
}
