import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';

class CenterController extends GetxController {
  final ServiceCenter _serviceCenter = ServiceCenter();
  List<Centerv> cv = [];
  @override
  // ignore: must_call_super
  void onInit() {
    fetchCenter();
  }

  Future fetchCenter() async {
    print("***************Fetching center********************");
    var centers = await _serviceCenter.fetchCenter();
    if (centers != null) {
      cv = centers;
    }
    return cv;
  }
}
