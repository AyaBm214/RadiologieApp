import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceMedcin.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';

class MedcinController extends GetxController {
  ServiceMedcin serviceMedcin = new ServiceMedcin();
  List<Medecin> cvm = [];
  @override
  void onInit() {
    fetchMedcin();
  }

  Future fetchMedcin() async {
    print("***************Fetching Medcin********************");
    var Medcins = await serviceMedcin.fetchMedcin();
    if (Medcins != null) {
      cvm = Medcins as List<Medecin>;
    }
    return cvm;
  }
}
