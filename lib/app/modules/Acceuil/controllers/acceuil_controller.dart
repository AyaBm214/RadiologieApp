import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/Acceuil/views/CenterModel.dart';
import 'package:radiologiev2/models/Services/ServiceCenter.dart';
class AcceuilController extends GetxController {
  ServiceCenter sc=new ServiceCenter();
  List<Centerv> cv=[];
  @override
  void onInit() {
    fetchCenter();
  }

  Future fetchCenter() async {
    print("***************Fetching center********************");
    var centers = await sc.fetchCenter();
    if (centers != null) {

      cv= centers ;
    }
    return cv;
  }

}





