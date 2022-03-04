import 'package:get/get.dart';
import 'package:radiologiev2/models/Medcin.dart';
import 'package:radiologiev2/models/Services/ServiceMedcin.dart';

class MedcinController extends GetxController {
  ServiceMedcin scm=new ServiceMedcin();
  List<Medcin> cvm=[];
  @override
  void onInit() {
    fetchMedcin();
  }

  Future fetchMedcin() async {
    print("***************Fetching Medcin********************");
    var Medcins = await scm.fetchMedcin();
    if (Medcins != null) {

      cvm= Medcins ;
    }
    return cvm;
  }

}